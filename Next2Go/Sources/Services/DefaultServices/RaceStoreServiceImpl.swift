//
//  RaceStoreServiceImpl.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Factory
import Foundation
import Model
import OSLog

actor RaceStoreServiceImpl: RaceStoreService {

    @Injected(\.raceAPI) private var apiService: RaceAPIService

    private let now: @Sendable () -> Int
    private let logger = Logger(subsystem: "Next2Go", category: "RaceStore")

    private var currentRaces: [RaceSummary] = []
    private var hasLoadedAtLeastOnce = false

    private var subscribers: [UUID: AsyncStream<[RaceSummary]>.Continuation] = [:]
    private var refreshTask: Task<Void, Never>?
    private var forceRefresh = false

    init(now: @escaping @Sendable () -> Int = { Int(Date().timeIntervalSince1970) }) {
        self.now = now
    }

    func stream() -> AsyncStream<[RaceSummary]> {
        startRefreshLoopIfNeeded()

        let id = UUID()

        return AsyncStream(bufferingPolicy: .bufferingNewest(1)) { continuation in
            subscribers[id] = continuation

            if hasLoadedAtLeastOnce {
                continuation.yield(currentRaces)
            }

            continuation.onTermination = { [id] _ in
                Task {
                    await self.removeSubscriber(id: id)
                }
            }
        }
    }

    func refresh() async {
        forceRefresh = true
        startRefreshLoopIfNeeded()
    }

    private func startRefreshLoopIfNeeded() {
        guard refreshTask == nil else { return }

        refreshTask = Task {
            await refreshLoop()
        }
    }

    private func removeSubscriber(id: UUID) {
        subscribers.removeValue(forKey: id)
    }

    /// Refreshes only when visible races may change
    /// Also reacts to manual refresh requests
    private func refreshLoop() async {
        defer {
            refreshTask = nil
        }

        var sleepTime = 1
        while !Task.isCancelled {
            logger.debug("Get list of races")
            guard let races = try? await apiService.getRaces() else {
                try? await Task.sleep(for: .seconds(sleepTime))

                // Increase sleep time to avoid network flooding
                if sleepTime < 10 {
                    sleepTime += 2
                }
                continue
            }

            let fetched = normalize(races, now: now())

            let didChange = !hasLoadedAtLeastOnce || fetched != currentRaces
            currentRaces = fetched
            hasLoadedAtLeastOnce = true

            if didChange {
                logger.debug("Broadcast list of races")
                broadcast(currentRaces)
            }

            guard let nextRefreshTime = nextRefreshTime(for: currentRaces, now: now()) else {
                return
            }

            let delay = max(0, nextRefreshTime - now())
            if delay == 0 {
                await Task.yield()
                continue
            }

            if await waitUntilNextRefresh(delay: delay) {
                forceRefresh = false
                continue
            }
        }
    }

    /// Sleeps in short steps
    /// This lets manual refresh end the wait early
    private func waitUntilNextRefresh(delay: Int) async -> Bool {
        var remainingDelay = delay

        while remainingDelay > 0 {
            if forceRefresh {
                return true
            }

            let currentSleepTime = min(1, remainingDelay)

            do {
                try await Task.sleep(nanoseconds: UInt64(currentSleepTime) * 1_000_000_000)
            } catch {
                return false
            }

            remainingDelay -= currentSleepTime
        }

        return false
    }

    private func broadcast(_ races: [RaceSummary]) {
        for continuation in subscribers.values {
            continuation.yield(races)
        }
    }

    /// Uses the same expiry window as the UI
    private func nextRefreshTime(for races: [RaceSummary], now: Int) -> Int? {
        let earliestExpiry = races
            .map { $0.advertisedStart.seconds + raceStoreServiceExpirationAllowance }
            .filter { $0 > now }
            .min()

        guard let earliestExpiry else {
            return nil
        }

        return earliestExpiry
    }

    /// Sorts in the store to keep later filtering stable
    private func normalize(_ races: [RaceSummary], now: Int) -> [RaceSummary] {
        races.sorted {
            if $0.advertisedStart.seconds != $1.advertisedStart.seconds {
                return $0.advertisedStart.seconds < $1.advertisedStart.seconds
            }
            return $0.raceId < $1.raceId
        }
        .filter { race in
            race.advertisedStart.seconds + raceStoreServiceExpirationAllowance >= now
        }
    }
}
