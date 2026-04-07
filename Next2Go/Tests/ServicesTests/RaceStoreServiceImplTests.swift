//
//  RaceStoreServiceImplTests.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Factory
import Model
@testable import Services
import Testing

@Test func streamEmitsNormalizedRaces() async throws {
    let firstRace = makeRaceSummary(raceId: "race-c", advertisedStart: 12)
    let secondRace = makeRaceSummary(raceId: "race-a", advertisedStart: 10)
    let thirdRace = makeRaceSummary(raceId: "race-b", advertisedStart: 10)

    let mockService = MockRaceAPIService(responses: [
        .success([firstRace, secondRace, thirdRace])
    ])

    Container.shared.raceAPI.reset()
    Container.shared.raceAPI.register { mockService }
    defer { Container.shared.raceAPI.reset() }

    let service = RaceStoreServiceImpl(now: { 0 })

    let stream = await service.stream()
    var iterator = stream.makeAsyncIterator()
    let emittedRaces = try #require(await iterator.next())

    #expect(emittedRaces == [secondRace, thirdRace, firstRace])
    #expect(await mockService.getRacesCallCount() == 1)
}

@Test func streamImmediatelyYieldsCachedRacesForNewSubscriber() async throws {
    let initialRaces = [
        makeRaceSummary(raceId: "race-1", advertisedStart: 50)
    ]
    let refreshedRaces = [
        makeRaceSummary(raceId: "race-2", advertisedStart: 60)
    ]

    let mockService = MockRaceAPIService(responses: [
        .success(initialRaces),
        .success(refreshedRaces)
    ])

    Container.shared.raceAPI.reset()
    Container.shared.raceAPI.register { mockService }
    defer { Container.shared.raceAPI.reset() }

    let service = RaceStoreServiceImpl(now: { 0 })

    let firstStream = await service.stream()
    var firstIterator = firstStream.makeAsyncIterator()
    _ = try #require(await firstIterator.next())

    let secondStream = await service.stream()
    var secondIterator = secondStream.makeAsyncIterator()
    let immediateValue = try #require(await secondIterator.next())

    #expect(immediateValue == initialRaces)
}

@Test func streamEmitsEmptyList() async throws {
    let mockService = MockRaceAPIService(responses: [
        .success([])
    ])

    Container.shared.raceAPI.reset()
    Container.shared.raceAPI.register { mockService }
    defer { Container.shared.raceAPI.reset() }

    let service = RaceStoreServiceImpl(now: { 10_000 })

    let stream = await service.stream()
    var iterator = stream.makeAsyncIterator()
    let emittedRaces = try #require(await iterator.next())

    #expect(emittedRaces.isEmpty)
    #expect(await mockService.getRacesCallCount() == 1)
}

/// Verifies races older than 60 seconds are filtered out.
@Test func streamFiltersRacesOlderThanSixtySeconds() async throws {
    let now = 1_000
    let tooOldRace = makeRaceSummary(raceId: "race-old", advertisedStart: now - 61)
    let boundaryRace = makeRaceSummary(raceId: "race-boundary", advertisedStart: now - 60)
    let recentRace = makeRaceSummary(raceId: "race-recent", advertisedStart: now - 10)

    let mockService = MockRaceAPIService(responses: [
        .success([recentRace, tooOldRace, boundaryRace])
    ])

    Container.shared.raceAPI.reset()
    Container.shared.raceAPI.register { mockService }
    defer { Container.shared.raceAPI.reset() }

    let service = RaceStoreServiceImpl(now: { now })

    let stream = await service.stream()
    var iterator = stream.makeAsyncIterator()
    let emittedRaces = try #require(await iterator.next())

    #expect(emittedRaces == [boundaryRace, recentRace])
}

@Test func refreshForcesImmediateReload() async throws {
    let initialRaces = [
        makeRaceSummary(raceId: "race-initial", advertisedStart: 11_000)
    ]
    let refreshedRaces = [
        makeRaceSummary(raceId: "race-refreshed", advertisedStart: 11_500)
    ]

    let mockService = MockRaceAPIService(responses: [
        .success(initialRaces),
        .success(refreshedRaces)
    ])

    Container.shared.raceAPI.reset()
    Container.shared.raceAPI.register { mockService }
    defer { Container.shared.raceAPI.reset() }

    let service = RaceStoreServiceImpl(now: { 10_000 })

    let stream = await service.stream()
    var iterator = stream.makeAsyncIterator()

    let firstEmission = try #require(await iterator.next())
    #expect(firstEmission == initialRaces)

    await service.refresh()

    let refreshedEmission = try #require(await iterator.next())
    #expect(refreshedEmission == refreshedRaces)
    #expect(await mockService.getRacesCallCount() == 2)
}

private func makeRaceSummary(raceId: String, advertisedStart: Int) -> RaceSummary {
    RaceSummary(
        advertisedStart: .init(seconds: advertisedStart),
        categoryId: "category",
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
        distance: 1200,
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
