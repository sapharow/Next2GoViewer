//
//  RaceAPIServiceImplTests.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 7/4/2026.
//

// swiftlint:disable line_length

import Foundation
import Model
@testable import Services
import Testing

@Test func getRacesReturnsDecodedRaces() async throws {
    let expectedRaceId = "race-1"
    URLProtocolStub.configure { request in
        #expect(request.url?.absoluteString == "https://api.neds.com.au/rest/v1/racing/?method=nextraces&count=10")
        return (
            .make(url: request.url!, statusCode: 200),
            makeAPIResponse(status: 200, message: "success", raceId: expectedRaceId)
        )
    }
    defer { URLProtocolStub.reset() }

    let service = RaceAPIServiceImpl()
    let races = try await service.getRaces()

    #expect(races.count == 1)
    #expect(races.first?.raceId == expectedRaceId)
}

@Test func getRacesThrowsAPIErrorWhenHTTPStatusIsNot200() async throws {
    URLProtocolStub.configure { request in
        (
            .make(url: request.url!, statusCode: 500),
            makeAPIResponse(status: 200, message: "success", raceId: "race-1")
        )
    }
    defer { URLProtocolStub.reset() }

    let service = RaceAPIServiceImpl()

    await #expect(throws: RaceAPIServiceImpl.RaceServiceError.apiError) {
        _ = try await service.getRaces()
    }
}

@Test func getRacesThrowsResponseErrorWhenPayloadStatusIsNot200() async throws {
    URLProtocolStub.configure { request in
        (
            .make(url: request.url!, statusCode: 200),
            makeAPIResponse(status: 500, message: "failure", raceId: "race-1")
        )
    }
    defer { URLProtocolStub.reset() }

    let service = RaceAPIServiceImpl()

    await #expect(throws: RaceAPIServiceImpl.RaceServiceError.responseError) {
        _ = try await service.getRaces()
    }
}

@Test func getRacesThrowsOnMalformedPayload() async throws {
    URLProtocolStub.configure { request in
        (
            .make(url: request.url!, statusCode: 200),
            Data("{\"invalid\":true}".utf8)
        )
    }
    defer { URLProtocolStub.reset() }

    let service = RaceAPIServiceImpl()

    await #expect(throws: DecodingError.self) {
        _ = try await service.getRaces()
    }
}

private func makeAPIResponse(status: Int, message: String, raceId: String) -> Data {
    Data(
        """
        {
          "status": \(status),
          "message": "\(message)",
          "data": {
            "next_to_go_ids": ["\(raceId)"],
            "race_summaries": {
              "\(raceId)": {
                "advertised_start": { "seconds": 1000 },
                "category_id": "category",
                "meeting_id": "meeting-id",
                "meeting_name": "Meeting Name",
                "race_form": {
                  "additional_data": "{\\"revealed_race_info\\":{\\"class\\":\\"MDN\\",\\"country\\":\\"AU\\",\\"gait\\":\\"Gallop\\",\\"group\\":\\"\\",\\"localised_prizemonies\\":{},\\"number\\":1,\\"prizemonies\\":{},\\"race_comment_provider\\":\\"provider\\",\\"race_name\\":\\"Race\\",\\"rail_position\\":\\"True\\",\\"start_type\\":\\"\\",\\"state\\":\\"NSW\\",\\"time\\":\\"2026-04-07T00:00:00Z\\",\\"track_circumference\\":0,\\"track_direction\\":\\"Left\\",\\"track_home_straight_metres\\":0,\\"track_name\\":\\"Track\\",\\"track_surface\\":\\"Turf\\"}}",
                  "distance": 1200,
                  "distance_type": { "id": "distance-type-id", "name": "Metres", "short_name": "m" },
                  "distance_type_id": "distance-type-id",
                  "generated": 1,
                  "race_comment": "Comment",
                  "race_comment_alternative": "Comment",
                  "silk_base_url": "example.com",
                  "track_condition": { "id": "track-condition-id", "name": "Good4", "short_name": "good4" },
                  "track_condition_id": "track-condition-id",
                  "weather": { "icon_uri": "SUN", "id": "weather-id", "name": "Fine", "short_name": "fine" },
                  "weather_id": "weather-id"
                },
                "race_id": "\(raceId)",
                "race_name": "Race \(raceId)",
                "race_number": 1,
                "venue_country": "AU",
                "venue_id": "venue-id",
                "venue_name": "Venue Name",
                "venue_state": "NSW"
              }
            }
          }
        }
        """.utf8
    )
}

private extension HTTPURLResponse {
    static func make(url: URL, statusCode: Int) -> HTTPURLResponse {
        HTTPURLResponse(
            url: url,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
    }
}

private final class URLProtocolStub: URLProtocol {

    typealias StubHandler = @Sendable (URLRequest) throws -> (HTTPURLResponse, Data)

    private static let lock = NSLock()
    nonisolated(unsafe) private static var handler: StubHandler?
    nonisolated(unsafe) private static var isRegistered = false

    static func configure(handler: @escaping StubHandler) {
        lock.lock()
        self.handler = handler
        lock.unlock()

        if !isRegistered {
            URLProtocol.registerClass(URLProtocolStub.self)
            isRegistered = true
        }
    }

    static func reset() {
        lock.lock()
        handler = nil
        lock.unlock()

        if isRegistered {
            URLProtocol.unregisterClass(URLProtocolStub.self)
            isRegistered = false
        }
    }

    override static func canInit(with request: URLRequest) -> Bool {
        true
    }

    override static func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        URLProtocolStub.lock.lock()
        let currentHandler = URLProtocolStub.handler
        URLProtocolStub.lock.unlock()

        guard let currentHandler else {
            client?.urlProtocol(self, didFailWithError: StubError.missingHandler)
            return
        }

        do {
            let (response, data) = try currentHandler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}

private enum StubError: Error {
    case missingHandler
}
