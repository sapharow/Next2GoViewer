//
//  DemoRaceAPIService.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation
import Model

#if targetEnvironment(simulator)

/// Preview-only races service returning deterministic demo data.
actor DemoRaceAPIService: RaceAPIService {

    func getRaces() async throws -> [RaceSummary] {
        try await Task.sleep(for: .milliseconds(300))
        return Array(Races.demoRaces.raceSummaries.values)
    }

}

#endif
