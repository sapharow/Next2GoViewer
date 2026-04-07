//
//  RaceCategory+Extensions.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Model
import SwiftUI

extension RaceCategory {

    var image: Image {
        switch self {
        case .greyhound:
            Image(.greyhound)
        case .harness:
            Image(.harness)
        case .horse:
            Image(.horse)
        }
    }

    var color: Color {
        switch self {
        case .greyhound:
            .indigo
        case .harness:
            .blue
        case .horse:
            .orange
        }
    }

}
