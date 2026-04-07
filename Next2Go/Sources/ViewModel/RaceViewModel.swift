//
//  RaceViewModel.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 5/4/2026.
//

import Foundation
import Model
import Observation
import SFSafeSymbols

@MainActor
@Observable
package final class RaceViewModel: Identifiable {

    package struct Weather: Sendable {
        package let symbol: SFSymbol
        package let accessibilityLabel: String
    }

    package struct TrackInfo: Hashable, Sendable {
        package let symbol: SFSymbol
        package let label: String
        package let accessibilityLabel: String
    }

    package struct CountdownTime: Sendable {
        package var label: String
        package var accessibilityLabel: String
    }

    // MARK: Constants

    package let id: String
    package let title: String
    package let category: RaceCategory
    package let weather: Weather?
    package let location: String
    package let trackInfo: [TrackInfo]

    package let accessibilityRaceName: String
    package let accessibilityRaceLocation: String

    package private(set) var countdown = CountdownTime(label: "", accessibilityLabel: "")
    package private(set) var isStarted = false
    package private(set) var isExpired = false

    private let startTimestamp: Int

    init(id: String, raceForm: RaceForm, seconds: Int, category: RaceCategory) {

        self.id = id
        self.category = category
        let country = raceForm.additionalData.revealedRaceInfo.country

        // UI shows a flag
        // Accessibility uses the country name
        let countryFlag = ISO3166.flag(alpha3: country) ?? country
        let countryName = ISO3166.localizedCountry(alpha3: country) ?? country
        weather = raceForm.weather

        title = raceForm.additionalData.revealedRaceInfo.raceName
        location = String(
            localized: .raceLocation(
                a: countryFlag,
                b: raceForm.additionalData.revealedRaceInfo.trackName,
                c: raceForm.additionalData.revealedRaceInfo.state
            )
        )
        trackInfo = Self.getTrackInfo(
            trackDistance: String(localized: .raceDistance(distance: "\(raceForm.distance)", units: raceForm.distanceType.shortName)),
            trackCondition: raceForm.trackCondition.name,
            trackDirection: raceForm.additionalData.revealedRaceInfo.trackDirection,
            trackSurface: raceForm.additionalData.revealedRaceInfo.trackSurface
        )

        accessibilityRaceName = String(localized: .accessibilityRaceName(name: title))
        accessibilityRaceLocation = String(
            localized: .raceLocation(
                a: raceForm.additionalData.revealedRaceInfo.trackName,
                b: raceForm.additionalData.revealedRaceInfo.state,
                c: countryName
            )
        )

        startTimestamp = seconds
        refreshCountdownState()
    }

    /// Updates countdown text and state
    /// Uses the shared grace window after start
    package func refreshCountdownState(now: Int = Int(Date().timeIntervalSince1970)) {
        let delta = startTimestamp - now

        if delta >= 0 {
            countdown = .init(
                label: Self.countdownFormatter.string(from: TimeInterval(delta)) ?? "0",
                accessibilityLabel: String(localized: .accessibilityRaceCountdownPositiveLabel(
                    seconds: Self.accessibilityCountdownFormatter.string(from: TimeInterval(delta)) ?? "0")
                )
            )
            isStarted = false
            isExpired = false
            return
        }

        let elapsedSinceStart = abs(delta)

        countdown = .init(
            label: Self.countdownFormatter.string(from: TimeInterval(delta)) ?? "0",
            accessibilityLabel: String(localized: .accessibilityRaceCountdownNegativeLabel(
                seconds: Self.accessibilityCountdownFormatter.string(from: TimeInterval(elapsedSinceStart)) ?? "0")
            )
        )
        isStarted = true
        isExpired = elapsedSinceStart >= raceStoreServiceExpirationAllowance
    }

}

extension RaceViewModel {

    private static let countdownFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 3
        formatter.zeroFormattingBehavior = [.dropLeading]
        return formatter
    }()

    private static let accessibilityCountdownFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 3
        formatter.zeroFormattingBehavior = [.dropLeading]
        return formatter
    }()

    static func getTrackInfo(trackDistance: String, trackCondition: String, trackDirection: String, trackSurface: String) -> [TrackInfo] {
        [
            .init(
                symbol: .pointToprightArrowTriangleBackwardToPointBottomleftScurvepathFill,
                label: trackDistance,
                accessibilityLabel: String(localized: .accessibilityTrackDistance(distance: trackDistance))
            ),
            .init(
                symbol: .pawprintFill,
                label: trackCondition,
                accessibilityLabel: String(localized: .accessibilityTrackCondition(condition: trackCondition))
            ),
            .init(
                symbol: .signpostRightAndLeftFill,
                label: trackDirection,
                accessibilityLabel: String(localized: .accessibilityTrackDirection(direction: trackDirection))
            ),
            .init(
                symbol: .appleMeditate,
                label: trackSurface,
                accessibilityLabel: String(localized: .accessibilityTrackSurface(surface: trackSurface))
            )
        ]
    }

}


extension RaceForm {

    // Keeps backend ids out of the view layer
    var weather: RaceViewModel.Weather? {
        switch weatherId {
        case "01994c9e-3b74-11e8-a5eb-06a5c6d9a756",
             "08e5f78c-1a36-11eb-9269-cef03e67f1a3":
                .init(
                    symbol: .sunMaxFill,
                    accessibilityLabel: String(localized: .accessibilityRaceWeatherLabel(weather: String(localized: .accessibilityRaceWeatherSunny)))
                )
        case "0b43a420-3b75-11e8-a5eb-06a5c6d9a756":
                .init(
                    symbol: .cloudSunFill,
                    accessibilityLabel: String(localized: .accessibilityRaceWeatherLabel(weather: String(localized: .accessibilityRaceWeatherOvercast)))
                )
        case "18c6f07a-b37b-11e7-aabe-061a47531548":
                .init(
                    symbol: .cloudFill,
                    accessibilityLabel: String(localized: .accessibilityRaceWeatherLabel(weather: String(localized: .accessibilityRaceWeatherCloudy)))
                )
        default:
            // nil or unknown
            nil
        }
    }

}

extension String {

    // Race start time
    var dateTimeToRelative: String? {
        // Creating ISO8601DateFormatter and RelativeDateTimeFormatter may cause a performance penalty
        // in large apps. This needs to be profiled and if penalty detected move parser families into a
        // service and access in a centralised way

        let parser = ISO8601DateFormatter()
        parser.formatOptions = [.withInternetDateTime]

        guard let date = parser.date(from: self) else {
            return nil
        }

        let formatter = RelativeDateTimeFormatter()
        formatter.locale = .current
        formatter.unitsStyle = .full

        return formatter.localizedString(for: date, relativeTo: Date())
    }

}

// MARK: - Preview

package extension RaceViewModel {

    static var preview: RaceViewModel {
        .init(id: "1", raceForm: .raceForm1, seconds: Int(Date.now.timeIntervalSince1970) + 50, category: .horse)
    }

}
