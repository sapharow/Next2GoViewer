//
//  MockRaceAPIService.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

import Model

actor MockRaceAPIService: RaceAPIService {

    enum Response: Sendable {
        case success([RaceSummary])
        case failure(MockError)
    }

    enum MockError: Error, Sendable, Equatable {
        case noResponseConfigured
        case forcedFailure
    }

    private var responses: [Response]
    private var callCount = 0

    init(responses: [Response]) {
        self.responses = responses
    }

    func getRacesCallCount() -> Int {
        callCount
    }

    func getRaces() async throws -> [RaceSummary] {
        callCount += 1

        guard !responses.isEmpty else {
            throw MockError.noResponseConfigured
        }

        switch responses.removeFirst() {
        case let .success(races):
            return races
        case let .failure(error):
            throw error
        }
    }
}
