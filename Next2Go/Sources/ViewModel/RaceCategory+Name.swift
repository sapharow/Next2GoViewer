//
//  RaceCategory.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Model

package extension RaceCategory {

    var name: String {
        switch self {
        case .greyhound:
            String(localized: .raceCategoryNameGreyhound)
        case .harness:
            String(localized: .raceCategoryNameHarness)
        case .horse:
            String(localized: .raceCategoryNameHorse)
        }
    }

}
