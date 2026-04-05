//
//  DemoRacesService+Races.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation
import Model

#if targetEnvironment(simulator)

extension RaceSummary {

    static let race1 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 10_800), // In 3 hours
        categoryId: "161d9be2-e909-4326-8c2c-35ed71fb460b",
        meetingId: "af91c6f0-23d9-55aa-b24e-270447185093",
        meetingName: "Narrabri",
        raceForm: .raceForm1,
        raceId: "bbb1fcfc-e979-4912-ab68-653f7b1e983d",
        raceName: "Luke Mcgrath Farrier Service John And Bery Dean Prelude",
        raceNumber: 2,
        venueCountry: "AUS",
        venueId: "5e3ff51d-936c-45f6-b98e-dcd0d83a7346",
        venueName: "Narrabri",
        venueState: "NSW"
    )

    static let race2 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 7_200), // In 2 hours
        categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae",
        meetingId: "2c1dede1-3d41-5355-99d2-4f77e52cd9c0",
        meetingName: "Remington Park",
        raceForm: .raceForm2,
        raceId: "ba2f008b-23dd-4bc1-baf1-278e7f582a89",
        raceName: "Race 11 - Trials",
        raceNumber: 11,
        venueCountry: "USA",
        venueId: "4ac3cc01-c5bf-4eab-a8e3-e130b11ad8f4",
        venueName: "Remington Park",
        venueState: "OK"
    )

    static let race3 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 3_600), // In 1 hour
        categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae",
        meetingId: "c723b521-b7f2-5f92-9cfa-fdcc1889e1eb",
        meetingName: "Sunshine Coast",
        raceForm: .raceForm3,
        raceId: "9ac0064a-feb3-46f3-933b-6b0a33f1ca17",
        raceName: "Digital Vision Direction Qtis Maiden Hcp",
        raceNumber: 2,
        venueCountry: "AUS",
        venueId: "39549566-14bc-4442-b94f-9b6b12fef5cb",
        venueName: "Sunshine Coast",
        venueState: "QLD"
    )

    static let race4 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 1_200), // In 20 min
        categoryId: "9daef0d7-bf3c-4f50-921d-8e818c60fe61",
        meetingId: "153e9349-f82a-56ee-9ea4-18c896ca4704",
        meetingName: "Bendigo",
        raceForm: .raceForm4,
        raceId: "b4ffb077-6088-4413-b802-5952bfc33b04",
        raceName: "Jarrod Larkin Concreting Consolation",
        raceNumber: 3,
        venueCountry: "AUS",
        venueId: "ab57e842-c2b1-4508-b1c8-dfa908a2db54",
        venueName: "Bendigo",
        venueState: "VIC"
    )

    static let race5 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 600), // In 10 min
        categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae",
        meetingId: "58ac7e36-a203-5f7b-8e36-7488ca73eaf0",
        meetingName: "Penola",
        raceForm: .raceForm5,
        raceId: "6bd4c0c9-9d45-445c-a0d1-a2ba91473602",
        raceName: "Barry Maney Ford Maiden Plate",
        raceNumber: 3,
        venueCountry: "AUS",
        venueId: "06e762b5-333e-4077-9299-ced0bc3d1428",
        venueName: "Penola",
        venueState: "SA"
    )

    static let race6 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 300), // In 5 min
        categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae",
        meetingId: "6189c684-8639-5a89-baef-2d8819d6bf1a",
        meetingName: "Los Alamitos Qh",
        raceForm: .raceForm6,
        raceId: "d883b8ad-c9b6-4aee-aa77-bab028f2a37d",
        raceName: "Race 6 - Maiden",
        raceNumber: 6,
        venueCountry: "USA",
        venueId: "1571380d-e55b-4981-bd6d-887b561cebff",
        venueName: "Los Alamitos Qh",
        venueState: "CA"
    )

    static let race7 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 30), // In 30 min
        categoryId: "9daef0d7-bf3c-4f50-921d-8e818c60fe61",
        meetingId: "3f0d7857-2323-5eaf-998d-893d495cde50",
        meetingName: "Mount Gambier",
        raceForm: .raceForm7,
        raceId: "853cf37a-82fe-4584-8f04-c30fe23229e8",
        raceName: "METAL WORX STAKE PR1 Division1",
        raceNumber: 5,
        venueCountry: "AUS",
        venueId: "ee0a708d-fb8a-424d-a37f-742b08540713",
        venueName: "Mount Gambier",
        venueState: "SA"
    )

    static let race8 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 5), // In 5 sec
        categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae",
        meetingId: "39c7d97e-f202-5d1e-b589-822110c311d4",
        meetingName: "Nakayama",
        raceForm: .raceForm8,
        raceId: "cdc6e0cf-086b-4867-af05-e03a7e463fb5",
        raceName: "Allowance Race",
        raceNumber: 6,
        venueCountry: "JPN",
        venueId: "c63ec15d-ef8c-4185-9b79-2a1c0f772404",
        venueName: "Nakayama",
        venueState: "JPN"
    )

    static let race9 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 10), // 10 sec ago
        categoryId: "4a2788f8-e825-4d36-9894-efd4baf1cfae",
        meetingId: "0fa03dc6-fe7f-51c1-8917-6f90389420bb",
        meetingName: "Mudgee",
        raceForm: .raceForm9,
        raceId: "1259bd42-107e-4557-a0a0-a44f710e1014",
        raceName: "The Sharp D.s Country Boosted Maiden Plate",
        raceNumber: 2,
        venueCountry: "AUS",
        venueId: "152d142a-45af-4fd0-a4b5-58147131f387",
        venueName: "Mudgee",
        venueState: "NSW"
    )

    static let race10 = RaceSummary(
        advertisedStart: .init(seconds: Int(Date.now.timeIntervalSince1970) + 50), // 50 sec ago
        categoryId: "9daef0d7-bf3c-4f50-921d-8e818c60fe61",
        meetingId: "cccca438-8245-56fa-ae00-918b730deb5a",
        meetingName: "Capalaba",
        raceForm: .raceForm10,
        raceId: "30225c1a-828d-4320-b94b-41c32b7830ba",
        raceName: "Betdeluxe You're On A Winner Maiden Final",
        raceNumber: 3,
        venueCountry: "AUS",
        venueId: "c346630e-e639-4282-9fea-d68d7769e864",
        venueName: "Capalaba",
        venueState: "QLD"
    )

}

#endif
