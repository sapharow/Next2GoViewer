//
//  RaceStoreService.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation

/// Seconds a race stays visible after start
package let raceStoreServiceExpirationAllowance = 60

package protocol RaceStoreService: Sendable {

    /// Streams race updates and yields cached races first
    func stream() async -> AsyncStream<[RaceSummary]>

    /// Requests an early refresh from the store
    func refresh() async

}
