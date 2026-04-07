//
//  APIRacesResponse.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

// Response from the API
package struct APIRacesResponse: Decodable, Sendable {
    package var data: Races
    package var message: String
    package var status: Int

    package init(data: Races, message: String, status: Int) {
        self.data = data
        self.message = message
        self.status = status
    }
}
