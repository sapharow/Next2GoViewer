//
//  RaceForm.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//


package struct RaceForm: Decodable, Sendable {

    package struct Details: Decodable, Equatable {

        package var iconUri: String?
        package var id: String
        package var name: String
        package var shortName: String

        package init(
            iconUri: String? = nil,
            id: String,
            name: String,
            shortName: String
        ) {
            self.iconUri = iconUri
            self.id = id
            self.name = name
            self.shortName = shortName
        }

        enum CodingKeys: String, CodingKey {
            case iconUri = "icon_uri"
            case id = "id"
            case name = "name"
            case shortName = "short_name"
        }
    }

    package struct AdditionalData: Decodable {

        package var revealedRaceInfo: RevealedRaceInfo

        package init(revealedRaceInfo: RevealedRaceInfo) {
            self.revealedRaceInfo = revealedRaceInfo
        }

        enum CodingKeys: String, CodingKey {
            case revealedRaceInfo = "revealed_race_info"
        }
    }


    @DecodedJSON package var additionalData: AdditionalData
    package var distance: Int
    package var distanceType: Details
    package var distanceTypeId: String
    package var generated: Int
    package var raceComment: String
    package var raceCommentAlternative: String
    package var silkBaseUrl: String
    package var trackCondition: Details
    package var trackConditionId: String
    package var weather: Details?
    package var weatherId: String?

    package init(
        additionalData: AdditionalData,
        distance: Int,
        distanceType: Details,
        distanceTypeId: String,
        generated: Int,
        raceComment: String,
        raceCommentAlternative: String,
        silkBaseUrl: String,
        trackCondition: Details,
        trackConditionId: String,
        weather: Details? = nil,
        weatherId: String? = nil
    ) {
        self._additionalData = .init(additionalData)
        self.distance = distance
        self.distanceType = distanceType
        self.distanceTypeId = distanceTypeId
        self.generated = generated
        self.raceComment = raceComment
        self.raceCommentAlternative = raceCommentAlternative
        self.silkBaseUrl = silkBaseUrl
        self.trackCondition = trackCondition
        self.trackConditionId = trackConditionId
        self.weather = weather
        self.weatherId = weatherId
    }

    enum CodingKeys: String, CodingKey {
        case additionalData = "additional_data"
        case distance
        case distanceType = "distance_type"
        case distanceTypeId = "distance_type_id"
        case generated
        case raceComment = "race_comment"
        case raceCommentAlternative = "race_comment_alternative"
        case silkBaseUrl = "silk_base_url"
        case trackCondition = "track_condition"
        case trackConditionId = "track_condition_id"
        case weather
        case weatherId = "weather_id"
    }
}
