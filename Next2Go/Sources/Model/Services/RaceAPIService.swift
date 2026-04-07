//
//  RaceAPIService.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation

package protocol RaceAPIService: Sendable {

    /// Retrieve races from the backend
    func getRaces() async throws -> [RaceSummary]

}
