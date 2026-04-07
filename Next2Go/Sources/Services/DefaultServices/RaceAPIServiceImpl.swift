//
//  RaceAPIServiceImpl.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation
import Model
import OSLog

actor RaceAPIServiceImpl: RaceAPIService {

    enum RaceServiceError: Error {
        case apiError
        case responseError
    }

    let session = URLSession.shared
    let decoder = JSONDecoder()
    let logger = Logger(subsystem: "Next2Go", category: "RaceAPI")

    let apiEndpoint = URL(string: "https://api.neds.com.au/rest/v1/racing/?method=nextraces&count=10")!

    func getRaces() async throws -> [RaceSummary] {
        do {
            let response = try await session.data(from: apiEndpoint)
            if let httpResponse = response.1 as? HTTPURLResponse, httpResponse.statusCode != 200 {
                logger.error("API response error: \(httpResponse.statusCode)")
                throw RaceServiceError.apiError
            }

            let apiResponse = try decoder.decode(APIRacesResponse.self, from: response.0)
            guard apiResponse.status == 200 else {
                logger.error("Response error: \(apiResponse.status) (\(apiResponse.message)")
                throw RaceServiceError.responseError
            }

            return Array(apiResponse.data.raceSummaries.values)
        } catch {
            logger.error("Can not obtain data from the endpoint: \(error)")
            throw error
        }
    }

}
