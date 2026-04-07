//
//  RaceListViewModel.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Factory
import Model
import Observation
import Services

@Observable
@MainActor
public final class RaceListViewModel {

    /// Latest races loaded from backend.
    package private(set) var raceViewModels: [RaceViewModel] = []

    /// Races to filter. Empty list means - all race categories are displayed
    package var raceCategories: Set<RaceCategory> = [] {
        didSet {
            updateRaceFiltering()
        }
    }

    /// Service resolved from Factory container registration in `Services`.
    @ObservationIgnored
    @Injected(\.raceStore)
    private var raceStoreService: RaceStoreService

    @ObservationIgnored
    private var raceUpdateTask: Task<Void, Never>?

    @ObservationIgnored
    private var unfilteredRaces: [RaceSummary] = []

    public init() {
        // Intentionally left blank
        let store = raceStoreService
        raceUpdateTask = Task { [store, weak self] in
            for await races in await store.stream() {
                if let self {
                    unfilteredRaces = races
                    updateRaceFiltering()
                }
            }
        }
    }

    deinit {
        raceUpdateTask?.cancel()
    }

    package func refreshRaces() {
        Task {
            await raceStoreService.refresh()
        }
    }

    func updateRaceFiltering() {
        raceViewModels = unfilteredRaces.compactMap { race in
            race.categoryId.raceCategory.map {
                RaceViewModel(id: race.raceId, raceForm: race.raceForm, seconds: race.advertisedStart.seconds, category: $0)
            }
        }
    }

}

extension String {

    var raceCategory: RaceCategory? {
        switch self {
        case "9daef0d7-bf3c-4f50-921d-8e818c60fe61": .greyhound
        case "161d9be2-e909-4326-8c2c-35ed71fb460b": .harness
        case "4a2788f8-e825-4d36-9894-efd4baf1cfae": .horse
        default: nil
        }
    }

}


// MARK: - Preview

#if targetEnvironment(simulator)
package extension RaceListViewModel {

    /// Preview-ready view model with demo services preconfigured.
    static var preview: RaceListViewModel {
        Container.shared.configurePreviewServices()
        return RaceListViewModel()
    }

}

#endif
