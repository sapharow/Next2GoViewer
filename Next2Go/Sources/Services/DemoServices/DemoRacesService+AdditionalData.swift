//
//  DemoRacesService+Races.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation
import Model

#if targetEnvironment(simulator)

extension RaceForm.AdditionalData {

    static let additionalData1 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "0-1 WIN",
            country: "AUS",
            gait: "P",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "10th": 136,
                    "1st": 3672,
                    "2nd": 1156,
                    "3rd": 748,
                    "4th": 408,
                    "5th": 272,
                    "6th": 136,
                    "7th": 136,
                    "8th": 136,
                    "9th": 136,
                    "total_value": 6936
                ],
                "NZD": [
                    "10th": 163,
                    "1st": 4406,
                    "2nd": 1387,
                    "3rd": 898,
                    "4th": 490,
                    "5th": 326,
                    "6th": 163,
                    "7th": 163,
                    "8th": 163,
                    "9th": 163,
                    "total_value": 8323
                ]
            ],
            number: 2,
            prizemonies: [
                "10th": 136,
                "1st": 3672,
                "2nd": 1156,
                "3rd": 748,
                "4th": 408,
                "5th": 272,
                "6th": 136,
                "7th": 136,
                "8th": 136,
                "9th": 136,
                "total_value": 6936
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Luke Mcgrath Farrier Service John And Bery Dean Prelude",
            railPosition: "",
            startType: "Mobile",
            state: "NSW",
            time: "2026-04-05T03:29:00Z",
            trackCircumference: 0,
            trackDirection: "Right",
            trackHomeStraightMetres: 0,
            trackName: "Narrabri",
            trackSurface: "All Weather"
        )
    )

    static let additionalData2 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "HCP",
            country: "USA",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "total_value": 21834
                ],
                "NZD": [
                    "total_value": 26201
                ]
            ],
            number: 11,
            prizemonies: [
                "total_value": 21834
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Race 11 - Trials",
            railPosition: "",
            startType: "",
            state: "OK",
            time: "2026-04-05T03:30:00Z",
            trackCircumference: 0,
            trackDirection: "Left",
            trackHomeStraightMetres: 0,
            trackName: "Remington Park",
            trackSurface: "Dirt"
        )
    )

    static let additionalData3 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "MDN",
            country: "AUS",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "10th": 500,
                    "1st": 16800,
                    "2nd": 5300,
                    "3rd": 2800,
                    "4th": 1600,
                    "5th": 1000,
                    "6th": 500,
                    "7th": 500,
                    "8th": 500,
                    "9th": 500,
                    "total_value": 30000
                ],
                "NZD": [
                    "10th": 600,
                    "1st": 20160,
                    "2nd": 6360,
                    "3rd": 3360,
                    "4th": 1920,
                    "5th": 1200,
                    "6th": 600,
                    "7th": 600,
                    "8th": 600,
                    "9th": 600,
                    "total_value": 36000
                ]
            ],
            number: 2,
            prizemonies: [
                "10th": 500,
                "1st": 16800,
                "2nd": 5300,
                "3rd": 2800,
                "4th": 1600,
                "5th": 1000,
                "6th": 500,
                "7th": 500,
                "8th": 500,
                "9th": 500,
                "total_value": 30000
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Digital Vision Direction Qtis Maiden Hcp",
            railPosition: "+8m Entire. (Pent: 7.10)",
            startType: "",
            state: "QLD",
            time: "2026-04-05T03:30:00Z",
            trackCircumference: 1967,
            trackDirection: "Right",
            trackHomeStraightMetres: 0,
            trackName: "Sunshine Coast",
            trackSurface: "Turf"
        )
    )

    static let additionalData4 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "Special Event",
            country: "AUS",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "1st": 2250,
                    "2nd": 690,
                    "3rd": 345,
                    "4th": 75,
                    "total_value": 3360
                ],
                "NZD": [
                    "1st": 2700,
                    "2nd": 828,
                    "3rd": 414,
                    "4th": 90,
                    "total_value": 4032
                ]
            ],
            number: 3,
            prizemonies: [
                "1st": 2250,
                "2nd": 690,
                "3rd": 345,
                "4th": 75,
                "total_value": 3360
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Jarrod Larkin Concreting Consolation",
            railPosition: "",
            startType: "",
            state: "VIC",
            time: "2026-04-05T03:34:00Z",
            trackCircumference: 0,
            trackDirection: "Left",
            trackHomeStraightMetres: 0,
            trackName: "Bendigo",
            trackSurface: "All Weather"
        )
    )

    static let additionalData5 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "MDN",
            country: "AUS",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "1st": 9900,
                    "2nd": 3300,
                    "3rd": 1900,
                    "4th": 1500,
                    "5th": 725,
                    "6th": 725,
                    "7th": 725,
                    "8th": 725,
                    "total_value": 19500
                ],
                "NZD": [
                    "1st": 11880,
                    "2nd": 3960,
                    "3rd": 2280,
                    "4th": 1800,
                    "5th": 870,
                    "6th": 870,
                    "7th": 870,
                    "8th": 870,
                    "total_value": 23400
                ]
            ],
            number: 3,
            prizemonies: [
                "1st": 9900,
                "2nd": 3300,
                "3rd": 1900,
                "4th": 1500,
                "5th": 725,
                "6th": 725,
                "7th": 725,
                "8th": 725,
                "total_value": 19500
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Barry Maney Ford Maiden Plate",
            railPosition: "True.",
            startType: "",
            state: "SA",
            time: "2026-04-05T03:35:00Z",
            trackCircumference: 1835,
            trackDirection: "Left",
            trackHomeStraightMetres: 0,
            trackName: "Penola",
            trackSurface: "Turf"
        )
    )

    static let additionalData6 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "MDN",
            country: "USA",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "total_value": 11645
                ],
                "NZD": [
                    "total_value": 13974
                ]
            ],
            number: 6,
            prizemonies: [
                "total_value": 11645
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Race 6 - Maiden",
            railPosition: "",
            startType: "",
            state: "CA",
            time: "2026-04-05T03:35:00Z",
            trackCircumference: 0,
            trackDirection: "Left",
            trackHomeStraightMetres: 0,
            trackName: "Los Alamitos Qh",
            trackSurface: "Dirt"
        )
    )

    static let additionalData7 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "5th Grade",
            country: "AUS",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "1st": 1305,
                    "2nd": 370,
                    "3rd": 185,
                    "total_value": 1860
                ],
                "NZD": [
                    "1st": 1566,
                    "2nd": 444,
                    "3rd": 222,
                    "total_value": 2232
                ]
            ],
            number: 5,
            prizemonies: [
                "total_value": 1860
            ],
            raceCommentProvider: "racingandsports",
            raceName: "METAL WORX STAKE PR1 Division1",
            railPosition: "",
            startType: "",
            state: "SA",
            time: "2026-04-05T03:37:00Z",
            trackCircumference: 0,
            trackDirection: "Left",
            trackHomeStraightMetres: 0,
            trackName: "Mount Gambier",
            trackSurface: "All Weather"
        )
    )

    static let additionalData8 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "ALLOW",
            country: "JPN",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "1st": 74824,
                    "2nd": 30112,
                    "3rd": 19162,
                    "4th": 10950,
                    "5th": 7482,
                    "total_value": 142531
                ],
                "NZD": [
                    "1st": 89789,
                    "2nd": 36134,
                    "3rd": 22994,
                    "4th": 13140,
                    "5th": 8978,
                    "total_value": 171037
                ]
            ],
            number: 6,
            prizemonies: [
                "total_value": 142531
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Allowance Race",
            railPosition: "",
            startType: "",
            state: "JPN",
            time: "2026-04-05T03:40:00Z",
            trackCircumference: 0,
            trackDirection: "Right",
            trackHomeStraightMetres: 0,
            trackName: "Nakayama",
            trackSurface: "Dirt"
        )
    )

    static let additionalData9 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "MDN",
            country: "AUS",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "10th": 725,
                    "1st": 15000,
                    "2nd": 5300,
                    "3rd": 2800,
                    "4th": 1475,
                    "5th": 975,
                    "6th": 800,
                    "7th": 725,
                    "8th": 725,
                    "9th": 725,
                    "total_value": 30000
                ],
                "NZD": [
                    "10th": 870,
                    "1st": 18000,
                    "2nd": 6360,
                    "3rd": 3360,
                    "4th": 1770,
                    "5th": 1170,
                    "6th": 960,
                    "7th": 870,
                    "8th": 870,
                    "9th": 870,
                    "total_value": 36000
                ]
            ],
            number: 2,
            prizemonies: [
                "10th": 725,
                "1st": 15000,
                "2nd": 5300,
                "3rd": 2800,
                "4th": 1475,
                "5th": 975,
                "6th": 800,
                "7th": 725,
                "8th": 725,
                "9th": 725,
                "total_value": 30000
            ],
            raceCommentProvider: "racingandsports",
            raceName: "The Sharp D.s Country Boosted Maiden Plate",
            railPosition: "True.",
            startType: "",
            state: "NSW",
            time: "2026-04-05T03:40:00Z",
            trackCircumference: 1750,
            trackDirection: "Right",
            trackHomeStraightMetres: 0,
            trackName: "Mudgee",
            trackSurface: "Turf"
        )
    )

    static let additionalData10 = RaceForm.AdditionalData(
        revealedRaceInfo: .init(
            raceClass: "Maiden",
            country: "AUS",
            gait: "Gallop",
            group: "",
            localisedPrizemonies: [
                "AUD": [
                    "1st": 2275,
                    "2nd": 700,
                    "3rd": 350,
                    "4th": 175,
                    "5th": 50,
                    "6th": 50,
                    "7th": 50,
                    "8th": 50,
                    "total_value": 3500
                ],
                "NZD": [
                    "1st": 2730,
                    "2nd": 840,
                    "3rd": 420,
                    "4th": 210,
                    "5th": 60,
                    "6th": 60,
                    "7th": 60,
                    "8th": 60,
                    "total_value": 4200
                ]
            ],
            number: 3,
            prizemonies: [
                "1st": 2275,
                "2nd": 700,
                "3rd": 350,
                "4th": 175,
                "total_value": 3500
            ],
            raceCommentProvider: "racingandsports",
            raceName: "Betdeluxe You're On A Winner Maiden Final",
            railPosition: "",
            startType: "",
            state: "QLD",
            time: "2026-04-05T03:40:00Z",
            trackCircumference: 0,
            trackDirection: "Left",
            trackHomeStraightMetres: 0,
            trackName: "Capalaba",
            trackSurface: "All Weather"
        )
    )
}

#endif
