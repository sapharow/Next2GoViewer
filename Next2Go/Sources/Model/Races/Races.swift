//
//  Races.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//


package struct Races: Decodable, Sendable {
    package var nextToGo: [String]
    package var raceSummaries: [String: RaceSummary]

    enum CodingKeys: String, CodingKey {
        case nextToGo = "next_to_go_ids"
        case raceSummaries = "race_summaries"
    }
}
