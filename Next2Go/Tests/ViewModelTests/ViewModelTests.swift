//
//  ViewModelTests.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Factory
import Foundation
import Model
import Services
import Testing
@testable import ViewModel

@Test @MainActor func raceViewModelCountdownBeforeStart() async throws {
    let startTimestamp = 1_000
    let viewModel = RaceViewModel(
        id: "race-1",
        raceForm: makeRaceForm(),
        seconds: startTimestamp,
        category: .horse
    )

    viewModel.refreshCountdownState(now: startTimestamp - 10)

    #expect(viewModel.isStarted == false)
    #expect(viewModel.isExpired == false)
    #expect(viewModel.countdown.label.isEmpty == false)
    #expect(viewModel.countdown.accessibilityLabel.isEmpty == false)
}

@Test @MainActor func raceViewModelCountdown() async throws {
    let startTimestamp = 1_000
    let viewModel = RaceViewModel(
        id: "race-2",
        raceForm: makeRaceForm(),
        seconds: startTimestamp,
        category: .horse
    )

    viewModel.refreshCountdownState(now: startTimestamp + 59)

    #expect(viewModel.isStarted == true)
    #expect(viewModel.isExpired == false)
    #expect(viewModel.countdown.label.isEmpty == false)
}

@Test @MainActor func raceViewModelCountdownIsExpired() async throws {
    let startTimestamp = 1_000
    let viewModel = RaceViewModel(
        id: "race-3",
        raceForm: makeRaceForm(),
        seconds: startTimestamp,
        category: .horse
    )

    viewModel.refreshCountdownState(now: startTimestamp + raceStoreServiceExpirationAllowance)

    #expect(viewModel.isStarted == true)
    #expect(viewModel.isExpired == true)
}

@Test @MainActor func raceViewModelTrackInfo() async throws {
    let trackInfo = RaceViewModel.getTrackInfo(
        trackDistance: "1200m",
        trackCondition: "Good4",
        trackDirection: "Left",
        trackSurface: "Turf"
    )

    #expect(trackInfo.count == 4)
    #expect(trackInfo.map(\.label) == ["1200m", "Good4", "Left", "Turf"])
}

@Test @MainActor func raceFormWeather() async throws {
    var sunnyForm = makeRaceForm()
    sunnyForm.weatherId = "01994c9e-3b74-11e8-a5eb-06a5c6d9a756"

    var unknownForm = makeRaceForm()
    unknownForm.weatherId = "unknown-weather-id"

    let sunnyViewModel = RaceViewModel(id: "weather-1", raceForm: sunnyForm, seconds: 2_000, category: .horse)
    let unknownViewModel = RaceViewModel(id: "weather-2", raceForm: unknownForm, seconds: 2_000, category: .horse)

    #expect(sunnyViewModel.weather?.symbol.rawValue == "sun.max.fill")
    #expect(sunnyViewModel.weather?.accessibilityLabel.isEmpty == false)
    #expect(unknownViewModel.weather == nil)
}

@Test @MainActor func raceListViewModelFilters() async throws {
    let now = Int(Date().timeIntervalSince1970)
    let store = MockRaceStoreService()
    Container.shared.raceStore.reset()
    Container.shared.raceStore.register { store }
    defer { Container.shared.raceStore.reset() }

    let viewModel = RaceListViewModel()
    _ = await waitUntil {
        let count = await store.subscriberCount()
        return count > 0
    }

    await store.emit(races: [
        makeRaceSummary(raceId: "unknown-category", categoryId: "unknown", advertisedStart: now + 100),
        makeRaceSummary(
            raceId: "expired-race",
            categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae",
            advertisedStart: now - raceStoreServiceExpirationAllowance
        ),
        makeRaceSummary(raceId: "race-1", categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae", advertisedStart: now + 100),
        makeRaceSummary(raceId: "race-2", categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae", advertisedStart: now + 101),
        makeRaceSummary(raceId: "race-3", categoryId: "161d9be2-e909-4326-8c2c-35ed71fb460b", advertisedStart: now + 102),
        makeRaceSummary(raceId: "race-4", categoryId: "9daef0d7-bf3c-4f50-921d-8e818c60fe61", advertisedStart: now + 103),
        makeRaceSummary(raceId: "race-5", categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae", advertisedStart: now + 104),
        makeRaceSummary(raceId: "race-6", categoryId: "161d9be2-e909-4326-8c2c-35ed71fb460b", advertisedStart: now + 105)
    ])

    let hasFiveRaces = await waitUntil {
        viewModel.raceViewModels.count == 5
    }

    #expect(hasFiveRaces == true)
    #expect(viewModel.raceViewModels.map(\.id) == ["race-1", "race-2", "race-3", "race-4", "race-5"])
}

@Test @MainActor func raceListViewModelRefresh() async throws {
    let store = MockRaceStoreService()
    Container.shared.raceStore.reset()
    Container.shared.raceStore.register { store }
    defer { Container.shared.raceStore.reset() }

    let viewModel = RaceListViewModel()
    viewModel.refreshRaces()

    let refreshed = await waitUntil {
        let count = await store.refreshCallCount()
        return count == 1
    }

    #expect(refreshed == true)
}

private actor MockRaceStoreService: RaceStoreService {
    private var subscribers: [UUID: AsyncStream<[RaceSummary]>.Continuation] = [:]
    private var refreshCalls = 0

    func stream() async -> AsyncStream<[RaceSummary]> {
        let id = UUID()
        return AsyncStream { continuation in
            subscribers[id] = continuation
            continuation.onTermination = { [weak self] _ in
                Task {
                    await self?.removeSubscriber(id: id)
                }
            }
        }
    }

    func refresh() async {
        refreshCalls += 1
    }

    func emit(races: [RaceSummary]) {
        for continuation in subscribers.values {
            continuation.yield(races)
        }
    }

    func refreshCallCount() -> Int {
        refreshCalls
    }

    func subscriberCount() -> Int {
        subscribers.count
    }

    private func removeSubscriber(id: UUID) {
        subscribers.removeValue(forKey: id)
    }
}

private func waitUntil(
    timeoutNanoseconds: UInt64 = 2_000_000_000,
    pollIntervalNanoseconds: UInt64 = 10_000_000,
    condition: @escaping @MainActor () async -> Bool
) async -> Bool {
    let start = DispatchTime.now().uptimeNanoseconds

    while DispatchTime.now().uptimeNanoseconds - start < timeoutNanoseconds {
        if await condition() {
            return true
        }

        try? await Task.sleep(nanoseconds: pollIntervalNanoseconds)
    }

    return false
}

private func makeRaceSummary(raceId: String, categoryId: String, advertisedStart: Int) -> RaceSummary {
    RaceSummary(
        advertisedStart: .init(seconds: advertisedStart),
        categoryId: categoryId,
        meetingId: "meeting-id",
        meetingName: "Meeting Name",
        raceForm: makeRaceForm(),
        raceId: raceId,
        raceName: "Race \(raceId)",
        raceNumber: 1,
        venueCountry: "AU",
        venueId: "venue-id",
        venueName: "Venue Name",
        venueState: "NSW"
    )
}

private func makeRaceForm() -> RaceForm {
    RaceForm(
        additionalData: .init(revealedRaceInfo: makeRevealedRaceInfo()),
        distance: 1_200,
        distanceType: .init(
            id: "distance-type-id",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "distance-type-id",
        generated: 1,
        raceComment: "Comment",
        raceCommentAlternative: "Comment",
        silkBaseUrl: "example.com",
        trackCondition: .init(
            id: "track-condition-id",
            name: "Good4",
            shortName: "good4"
        ),
        trackConditionId: "track-condition-id",
        weather: .init(
            iconUri: "SUN",
            id: "weather-id",
            name: "Fine",
            shortName: "fine"
        ),
        weatherId: "weather-id"
    )
}

private func makeRevealedRaceInfo() -> RevealedRaceInfo {
    RevealedRaceInfo(
        raceClass: "MDN",
        country: "AU",
        gait: "Gallop",
        group: "",
        localisedPrizemonies: [:],
        number: 1,
        prizemonies: [:],
        raceCommentProvider: "provider",
        raceName: "Race",
        railPosition: "True",
        startType: "",
        state: "NSW",
        time: "2026-04-07T00:00:00Z",
        trackCircumference: 0,
        trackDirection: "Left",
        trackHomeStraightMetres: 0,
        trackName: "Track",
        trackSurface: "Turf"
    )
}
