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
package final class RaceViewModel {

    package enum RaceCategory {
        case greyhound
        case harness
        case horse
    }

    package let title: String
    package let category: RaceCategory
    package let weatherSymbol: SFSymbol?
    package let location: String
    package let trackDistance: String
    package let trackCondition: String
    package let trackDirection: String
    package let trackSurface: String
    package let startDateTime: String?
    private let startTimestamp: Int

    private static let countdownFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.maximumUnitCount = 2
        formatter.zeroFormattingBehavior = [.dropLeading]
        return formatter
    }()

    private static let elapsedFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second]
        formatter.unitsStyle = .short
        formatter.maximumUnitCount = 1
        return formatter
    }()

    package private(set) var timeLeft = String()
    package private(set) var isStarted = false
    package private(set) var isExpired = false

    private var countdownTimer: Timer?

    init(raceForm: RaceForm, seconds: Int, category: RaceCategory) {

        self.category = category
        let country = raceForm.additionalData.revealedRaceInfo.country

        // Important - emoji rendering is broken for SwiftUI Previews in XCode 26.3
        // Previews are broken in XCode 26.4 - needs XCode 26.5
        let countryFlag = ISO3166.flag(alpha3: country) ?? country

        title = raceForm.additionalData.revealedRaceInfo.raceName
        weatherSymbol = raceForm.weatherSymbol
        location = String(localized: .raceTitle(
            flag: countryFlag,
            trackName: raceForm.additionalData.revealedRaceInfo.trackName,
            state: raceForm.additionalData.revealedRaceInfo.state)
        )

        trackDistance = String(localized: .raceDistance(distance: "\(raceForm.distance)", units: raceForm.distanceType.shortName))
        trackCondition = raceForm.trackCondition.name
        trackDirection = raceForm.additionalData.revealedRaceInfo.trackDirection
        trackSurface = raceForm.additionalData.revealedRaceInfo.trackSurface

        if let startDateTime = raceForm.additionalData.revealedRaceInfo.time.dateTimeToRelative {
            self.startDateTime = String(localized: .raceStartsAt(time: startDateTime))
        } else {
            startDateTime = nil
        }
        startTimestamp = seconds

        startCountdownTimer()
    }

    isolated deinit {
        countdownTimer?.invalidate()
    }

    // Starts and maintains a 1-second countdown against race start epoch.
    private func startCountdownTimer() {
        updateCountdownState()

        guard !isExpired else {
            return
        }

        countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.updateCountdownState()
            }
        }
    }

    // Updates countdown label and race lifecycle flags
    private func updateCountdownState() {
        let now = Int(Date().timeIntervalSince1970)
        let delta = startTimestamp - now

        if delta >= 0 {
            timeLeft = Self.countdownFormatter.string(from: TimeInterval(delta)) ?? "0"
            isStarted = false
            isExpired = false
            return
        }

        let elapsedSinceStart = abs(delta)
        timeLeft = "-\(Self.elapsedFormatter.string(from: TimeInterval(elapsedSinceStart)) ?? "0")"
        isStarted = true
        isExpired = elapsedSinceStart >= 60

        if isExpired {
            countdownTimer?.invalidate()
            countdownTimer = nil
        }
    }

}

extension RaceForm {

    // Race weather
    var weatherSymbol: SFSymbol? {
        switch weatherId {
        case "01994c9e-3b74-11e8-a5eb-06a5c6d9a756",
             "08e5f78c-1a36-11eb-9269-cef03e67f1a3": .sunMaxFill
        case "0b43a420-3b75-11e8-a5eb-06a5c6d9a756": .cloudSunFill
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

#if targetEnvironment(simulator)

package extension RaceViewModel {

    static var preview: RaceViewModel {
        .init(raceForm: .raceForm1, seconds: Int(Date.now.timeIntervalSince1970) + 50, category: .horse)
    }

}

#endif
