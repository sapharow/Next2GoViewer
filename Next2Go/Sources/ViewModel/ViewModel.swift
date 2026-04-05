//
//  ViewModel.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Factory
import Model
import Observation
import Services

@Observable
package final class ViewModel {

    /// Latest races loaded from backend.
    package private(set) var races: Races?

    /// Most recent load error if any.
    package private(set) var lastError: (any Error)?

    /// Service resolved from Factory container registration in `Services`.
    @ObservationIgnored
    @Injected(\.races)
    private var racesService: RacesService

    package init() {}

    /// Loads races and updates observable state for the UI.
    package func loadRaces() async {
        do {
            races = try await racesService.getRaces()
            lastError = nil
        } catch {
            lastError = error
        }
    }
}

// MARK: - Preview

#if targetEnvironment(simulator)
package extension ViewModel {

    /// Preview-ready view model with demo services preconfigured.
    static var preview: ViewModel {
        Container.shared.configurePreviewServices()
        return ViewModel()
    }

}

#endif
