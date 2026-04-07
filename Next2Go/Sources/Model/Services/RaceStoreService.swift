//
//  RaceStoreService.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation

package protocol RaceStoreService: Sendable {

    /// Retrieve race updates yielding current Races instance first (if any)
    func stream() async -> AsyncStream<[RaceSummary]>

    /// Force-refresh data
    func refresh() async

}
