//
//  RaceSummary.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//


package struct RaceSummary: Decodable, Sendable, Equatable {

    package struct StartTime: Decodable, Sendable, Equatable {

        package var seconds: Int

        package init(seconds: Int) {
            self.seconds = seconds
        }
    }

    package var advertisedStart: StartTime
    package var categoryId: String
    package var meetingId: String?
    package var meetingName: String?
    package var raceForm: RaceForm
    package var raceId: String
    package var raceName: String
    package var raceNumber: Int?
    package var venueCountry: String?
    package var venueId: String?
    package var venueName: String?
    package var venueState: String?

    package init(
        advertisedStart: StartTime,
        categoryId: String,
        meetingId: String,
        meetingName: String,
        raceForm: RaceForm,
        raceId: String,
        raceName: String,
        raceNumber: Int,
        venueCountry: String,
        venueId: String,
        venueName: String,
        venueState: String
    ) {
        self.advertisedStart = advertisedStart
        self.categoryId = categoryId
        self.meetingId = meetingId
        self.meetingName = meetingName
        self.raceForm = raceForm
        self.raceId = raceId
        self.raceName = raceName
        self.raceNumber = raceNumber
        self.venueCountry = venueCountry
        self.venueId = venueId
        self.venueName = venueName
        self.venueState = venueState
    }

    enum CodingKeys: String, CodingKey {
        case advertisedStart = "advertised_start"
        case categoryId = "category_id"
        case meetingId = "meeting_id"
        case meetingName = "meeting_name"
        case raceForm = "race_form"
        case raceId = "race_id"
        case raceName = "race_name"
        case raceNumber = "race_number"
        case venueCountry = "venue_country"
        case venueId = "venue_id"
        case venueName = "venue_name"
        case venueState = "venue_state"
    }

}
