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
    var races: Factory<RacesService> {
        self { RacesServiceImpl() }
            .scope(.cached)
    }

#if targetEnvironment(simulator)

    /// Configures demo implementations used only by SwiftUI previews.
    func configurePreviewServices() {
        races.reset()
        races.preview { DemoRacesService() }
    }

#endif

}
