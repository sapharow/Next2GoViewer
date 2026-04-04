//
//  RacesTests.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation
@testable import Model
import Testing

@Test func decodeApiRacesResponse() async throws {
    let apiResponse = try loadJSON(named: "API") as APIRacesResponse

    #expect(apiResponse.message == "Next 2 races from each category")
    #expect(apiResponse.status == 200)
    #expect(apiResponse.data.nextToGo == [
        "2e73126f-1c99-4f28-8d70-e235cf93526d",
        "353a2941-6f86-4b90-bc86-9fa6b9770ab5"
    ])

    #expect(apiResponse.data.raceSummaries.count == 2)
    #expect(Set(apiResponse.data.raceSummaries.keys) == Set(apiResponse.data.nextToGo))

    // Simplistic tests as leaf structures are tested thoroughly.
    let firstRaceSummary = try #require(apiResponse.data.raceSummaries["2e73126f-1c99-4f28-8d70-e235cf93526d"])
    #expect(firstRaceSummary.raceId == "2e73126f-1c99-4f28-8d70-e235cf93526d")
    #expect(firstRaceSummary.meetingName == "Sam Houston")
    #expect(firstRaceSummary.raceNumber == 4)

    let secondRaceSummary = try #require(apiResponse.data.raceSummaries["353a2941-6f86-4b90-bc86-9fa6b9770ab5"])
    #expect(secondRaceSummary.raceId == "353a2941-6f86-4b90-bc86-9fa6b9770ab5")
    #expect(secondRaceSummary.meetingName == "Charles Town")
    #expect(secondRaceSummary.raceNumber == 5)
}

@Test func decodeRaceForm() async throws {
    let raceForm = try loadJSON(named: "RaceForm") as RaceForm

    #expect(raceForm.distance == 1800)
    #expect(raceForm.distanceType == .init(id: "570775ae-09ec-42d5-989d-7c8f06366aa7", name: "Metres", shortName: "m"))
    #expect(raceForm.distanceTypeId == "570775ae-09ec-42d5-989d-7c8f06366aa7")
    #expect(raceForm.generated == 1)

    // swiftlint:disable:next line_length
    #expect(raceForm.raceComment == "MUKHTALIF (4) creates interest in the opener. He's an import for the Ciaron Maher yard who was last seen winning very well in fast time at York over 2112m, posting a rating that would take a bit of beating in this. He's won a 1500m trial here which suggests he should be quite forward and he can make a winning local debut. ENGINE OF WAR (10) resumed over 1500m at Caulfield Heath and ran well off a strong tempo, sticking on well nearer the inside to finish second. He showed good staying promise last time in and can improve into this. CURSE IT (3) had his winning streak come to an end last time at Caulfield Heath but still ran well and should be right there again. OVERACTIVE (5) improved nicely second up to score narrowly at Cranbourne and will be fitter again. HALLOWED HALLS (11) beat CURSE IT last time and has to be respected deep into his first campaign.")

    // swiftlint:disable:next line_length
    #expect(raceForm.raceCommentAlternative == "MUKHTALIF (4) creates interest in the opener. He's an import for the Ciaron Maher yard who was last seen winning very well in fast time at York over 2112m, posting a rating that would take a bit of beating in this. He's won a 1500m trial here which suggests he should be quite forward and he can make a winning local debut. ENGINE OF WAR (10) resumed over 1500m at Caulfield Heath and ran well off a strong tempo, sticking on well nearer the inside to finish second. He showed good staying promise last time in and can improve into this. CURSE IT (3) had his winning streak come to an end last time at Caulfield Heath but still ran well and should be right there again. OVERACTIVE (5) improved nicely second up to score narrowly at Cranbourne and will be fitter again. HALLOWED HALLS (11) beat CURSE IT last time and has to be respected deep into his first campaign.")
    #expect(raceForm.silkBaseUrl == "drr38safykj6s.cloudfront.net")
    #expect(raceForm.trackCondition == .init(id: "11d7e662-487a-11ea-9d54-4689356d4521", name: "Good4", shortName: "good4"))
    #expect(raceForm.trackConditionId == "11d7e662-487a-11ea-9d54-4689356d4521")
    #expect(raceForm.weather == .init(iconUri: "FINE", id: "08e5f78c-1a36-11eb-9269-cef03e67f1a3", name: "FINE", shortName: "fine"))
    #expect(raceForm.weatherId == "08e5f78c-1a36-11eb-9269-cef03e67f1a3")
}

@Test func decodeRaces() async throws {
    let apiResponse = try loadJSON(named: "API") as APIRacesResponse
    let races = apiResponse.data

    #expect(races.nextToGo == [
        "2e73126f-1c99-4f28-8d70-e235cf93526d",
        "353a2941-6f86-4b90-bc86-9fa6b9770ab5"
    ])
    #expect(races.raceSummaries.count == 2)
    #expect(Set(races.raceSummaries.keys) == Set(races.nextToGo))
}

@Test func decodeRaceSummary() async throws {
    let raceSummary = try loadJSON(named: "RaceSummary") as RaceSummary

    #expect(raceSummary.advertisedStart.seconds == 1775263680)
    #expect(raceSummary.categoryId == "4a2788f8-e825-4d36-9894-efd4baf1cfae")
    #expect(raceSummary.meetingId == "116de3fb-4921-5644-aad5-02d16eef744b")
    #expect(raceSummary.meetingName == "Sam Houston")
    #expect(raceSummary.raceId == "2e73126f-1c99-4f28-8d70-e235cf93526d")
    #expect(raceSummary.raceName == "Race 4 - Claiming")
    #expect(raceSummary.raceNumber == 4)
    #expect(raceSummary.venueCountry == "USA")
    #expect(raceSummary.venueId == "a90f225d-be9b-4668-a4f9-0701e3e04121")
    #expect(raceSummary.venueName == "Sam Houston")
    #expect(raceSummary.venueState == "TX")
}

@Test func decodeRevealedRaceInfo() async throws {
    let raceInfo = try loadJSON(named: "RevealedRaceInfo") as RevealedRaceInfo

    #expect(raceInfo.raceClass == "MDN")
    #expect(raceInfo.country == "USA")
    #expect(raceInfo.gait == "Gallop")
    #expect(raceInfo.group == "")
    #expect(raceInfo.localisedPrizemonies == [
        "AUD": [
            "1st": 30170,
            "2nd": 9578,
            "3rd": 4789,
            "4th": 3352,
            "total_value": 47889
        ],
        "NZD": [
            "1st": 36204,
            "2nd": 11494,
            "3rd": 5747,
            "4th": 4022,
            "total_value": 57467
        ]
    ])
    #expect(raceInfo.number == 5)
    #expect(raceInfo.prizemonies == [
        "total_value": 47889
    ])
    #expect(raceInfo.raceCommentProvider == "racingandsports")
    #expect(raceInfo.raceName == "Race 5 - Maiden Special Weight")
    #expect(raceInfo.railPosition == "True")
    #expect(raceInfo.startType == "")
    #expect(raceInfo.state == "WV")
    #expect(raceInfo.time == "2026-04-04T01:10:00Z")
    #expect(raceInfo.trackCircumference == 0)
    #expect(raceInfo.trackDirection == "Left")
    #expect(raceInfo.trackHomeStraightMetres == 0)
    #expect(raceInfo.trackName == "Charles Town")
    #expect(raceInfo.trackSurface == "Dirt")
}
