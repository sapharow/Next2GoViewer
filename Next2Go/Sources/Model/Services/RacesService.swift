//
//  RacesService.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation

package protocol RacesService {

    /// Retrieve races from the backend
    func getRaces() async throws -> Races

}
