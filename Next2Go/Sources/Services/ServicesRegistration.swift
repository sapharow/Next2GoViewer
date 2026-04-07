//
//  ServicesRegistration.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Factory
import Model

/// Services registration
package extension Container {

    /// Races service available throughout the app
    var raceAPI: Factory<RaceAPIService> {
        self { RaceAPIServiceImpl() }
            .scope(.cached)
    }

    var raceStore: Factory<RaceStoreService> {
        self { RaceStoreServiceImpl() }
            .scope(.cached)
    }

    /// Configures demo implementations used only by SwiftUI previews.
    func configurePreviewServices() {
        raceAPI.reset()
#if targetEnvironment(simulator)
        raceAPI.preview { DemoRaceAPIService() }
#endif
    }

}
