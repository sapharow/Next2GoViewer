//
//  RaceListViewModel.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Factory
import Foundation
import Model
import Observation
import Services

@Observable
@MainActor
public final class RaceListViewModel {

    package let categoriesLabel = String(localized: .categoryFilterLabel)

    private let visibleRacesLimit = 5

    /// Empty set means all categories
    package var raceCategories: Set<RaceCategory> = [] {
        didSet {
            updateRaceFiltering()
        }
    }

    /// Races currently visible in the UI
    package private(set) var raceViewModels: [RaceViewModel] = []

    @ObservationIgnored
    @Injected(\.raceStore)
    private var raceStoreService: RaceStoreService

    @ObservationIgnored
    private var raceUpdateTask: Task<Void, Never>?

    @ObservationIgnored
    private var countdownTimer: Timer?

    @ObservationIgnored
    private var allRaceViewModels: [RaceViewModel] = []

    /// Store updates data changes
    /// Timer keeps countdowns moving between updates
    public init() {
        startChildrenCountdownTimer()

        let store = raceStoreService
        raceUpdateTask = Task { [store, weak self] in
            for await races in await store.stream() {
                if let self {
                    allRaceViewModels = Self.makeRaceViewModels(from: races)
                    refreshChildrenCountdown()
                }
            }
        }
    }

    isolated deinit {
        raceUpdateTask?.cancel()
        countdownTimer?.invalidate()
    }

    package func refreshRaces() {
        Task {
            await raceStoreService.refresh()
        }
    }

    private func startChildrenCountdownTimer() {
        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            Task { @MainActor in
                guard let self else {
                    return
                }

                self.refreshChildrenCountdown()
            }
        }
    }

    private func refreshChildrenCountdown() {
        let now = Int(Date().timeIntervalSince1970)
        allRaceViewModels.forEach { $0.refreshCountdownState(now: now) }
        updateRaceFiltering()
    }

    /// Applies category, expiry, and count rules in one place
    private func updateRaceFiltering() {
        raceViewModels = Array(
            allRaceViewModels
                .filter { race in
                    if !raceCategories.isEmpty, !raceCategories.contains(race.category) {
                        return false
                    }

                    return !race.isExpired
                }
                .prefix(visibleRacesLimit)
        )
    }

    /// Maps service race summaries to child view models.
    private static func makeRaceViewModels(from races: [RaceSummary]) -> [RaceViewModel] {
        races.compactMap { race in
            guard let category = race.categoryId.raceCategory else {
                return nil
            }

            return RaceViewModel(
                id: race.raceId,
                raceForm: race.raceForm,
                seconds: race.advertisedStart.seconds,
                category: category
            )
        }
    }

}

extension String {

    /// Maps backend UUIDs to app categories
    var raceCategory: RaceCategory? {
        switch self {
        case "9daef0d7-bf3c-4f50-921d-8e818c60fe61": .greyhound
        case "161d9be2-e909-4326-8c2c-35ed71fb460b": .harness
        case "4a2788f8-e825-4d36-9894-efd4baf1cfae": .horse
        default: nil
        }
    }

}


// MARK: - Preview

#if targetEnvironment(simulator)
package extension RaceListViewModel {

    /// Preview-ready view model with demo services preconfigured.
    static var preview: RaceListViewModel {
        Container.shared.configurePreviewServices()
        return RaceListViewModel()
    }

}

#endif
