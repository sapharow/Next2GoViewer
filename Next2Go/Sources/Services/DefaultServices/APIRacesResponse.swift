//
//  APIRacesResponse.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Model

// Response from the API
struct APIRacesResponse: Decodable, Sendable {
    var data: Races
    var message: String
    var status: Int
}
