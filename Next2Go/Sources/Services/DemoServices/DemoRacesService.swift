//
//  DemoRacesService.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation
import Model

#if targetEnvironment(simulator)

/// Preview-only races service returning deterministic demo data.
actor DemoRacesService: RacesService {

    func getRaces() async throws -> Races {
        try await Task.sleep(for: .milliseconds(300))
        return .demoRaces
    }

}

#endif
