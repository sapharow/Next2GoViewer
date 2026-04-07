//
//  RaceCategory.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

package enum RaceCategory: Sendable {
    case greyhound
    case harness
    case horse
}

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
