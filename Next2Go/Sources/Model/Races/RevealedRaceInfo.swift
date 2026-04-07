//
//  RevealedRaceInfo.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//


package struct RevealedRaceInfo: Decodable, Sendable, Equatable {

    package var raceClass: String
    package var country: String
    package var gait: String?
    package var group: String?
    package var localisedPrizemonies: [String: [String: Int]]?
    package var number: Int?
    package var prizemonies: [String: Int]?
    package var raceCommentProvider: String?
    package var raceName: String
    package var railPosition: String?
    package var startType: String?
    package var state: String
    package var time: String?
    package var trackCircumference: Int?
    package var trackDirection: String
    package var trackHomeStraightMetres: Int?
    package var trackName: String
    package var trackSurface: String

    package init(
        raceClass: String,
        country: String,
        gait: String,
        group: String,
        localisedPrizemonies: [String: [String: Int]]?,
        number: Int,
        prizemonies: [String: Int],
        raceCommentProvider: String,
        raceName: String,
        railPosition: String,
        startType: String,
        state: String,
        time: String,
        trackCircumference: Int,
        trackDirection: String,
        trackHomeStraightMetres: Int,
        trackName: String,
        trackSurface: String
    ) {
        self.raceClass = raceClass
        self.country = country
        self.gait = gait
        self.group = group
        self.localisedPrizemonies = localisedPrizemonies
        self.number = number
        self.prizemonies = prizemonies
        self.raceCommentProvider = raceCommentProvider
        self.raceName = raceName
        self.railPosition = railPosition
        self.startType = startType
        self.state = state
        self.time = time
        self.trackCircumference = trackCircumference
        self.trackDirection = trackDirection
        self.trackHomeStraightMetres = trackHomeStraightMetres
        self.trackName = trackName
        self.trackSurface = trackSurface
    }

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
