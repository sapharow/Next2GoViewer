//
//  RevealedRaceInfo.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//


package struct RevealedRaceInfo: Decodable, Sendable {
    package var raceClass: String
    package var country: String
    package var gait: String
    package var group: String
    package var localisedPrizemonies: [String: [String: Int]]
    package var number: Int
    package var prizemonies: [String: Int]
    package var raceCommentProvider: String
    package var raceName: String
    package var railPosition: String
    package var startType: String
    package var state: String
    package var time: String // Seems like ISO8601
    package var trackCircumference: Int
    package var trackDirection: String
    package var trackHomeStraightMetres: Int
    package var trackName: String
    package var trackSurface: String

    enum CodingKeys: String, CodingKey {
        case raceClass = "class"
        case country
        case gait
        case group
        case localisedPrizemonies = "localised_prizemonies"
        case number
        case prizemonies
        case raceCommentProvider = "race_comment_provider"
        case raceName = "race_name"
        case railPosition = "rail_position"
        case startType = "start_type"
        case state
        case time
        case trackCircumference = "track_circumference"
        case trackDirection = "track_direction"
        case trackHomeStraightMetres = "track_home_straight_metres"
        case trackName = "track_name"
        case trackSurface = "track_surface"
    }

}
