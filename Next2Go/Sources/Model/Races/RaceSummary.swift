//
//  RaceSummary.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//


package struct RaceSummary: Decodable, Sendable {
    package struct StartTime: Decodable, Sendable {
        var seconds: Int
    }

    package var advertisedStart: StartTime
    package var categoryId: String
    package var meetingId: String
    package var meetingName: String
    package var raceForm: RaceForm
    package var raceId: String
    package var raceName: String
    package var raceNumber: Int
    package var venueCountry: String
    package var venueId: String
    package var venueName: String
    package var venueState: String

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
