//
//  DemoRacesService+Races.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

// swiftlint:disable line_length

import Foundation
import Model

#if targetEnvironment(simulator)

package extension RaceForm {

    static let raceForm1 = RaceForm(
        additionalData: .additionalData1,
        distance: 1760,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "CINNAMON (8) has been competitive of late and kept the ball rolling last time when 2.25 metres from the winner in second over 1980m at Tamworth. Should enjoy a nice smother from this draw and will be looking for a split at some stage. Good enough to put herself in the winners' stall. FRANCO STYLES (7) scored at Newcastle two runs ago before having his colours lowered when third at his latest appearance over 2030m at Newcastle, beaten 15 metres. Should enjoy a nice smother from this draw and will be looking for a split at some stage. Primary contender if anywhere near his best. TONYS DREAM (10) was out of the money two starts ago then things went wrong last start when she broke and finished a distant last over 1609m at Newcastle. No favours expected from this draw. Won't find this any harder and she can bounce back. TRY CATCHING ME (9) must be included on the back of some solid recent form, most recently when third at Tamworth over 1980m.",
        raceCommentAlternative: "CINNAMON (8) has been competitive of late and kept the ball rolling last time when 2.25 metres from the winner in second over 1980m at Tamworth. Should enjoy a nice smother from this draw and will be looking for a split at some stage. Good enough to put herself in the winners' stall. FRANCO STYLES (7) scored at Newcastle two runs ago before having his colours lowered when third at his latest appearance over 2030m at Newcastle, beaten 15 metres. Should enjoy a nice smother from this draw and will be looking for a split at some stage. Primary contender if anywhere near his best. TONYS DREAM (10) was out of the money two starts ago then things went wrong last start when she broke and finished a distant last over 1609m at Newcastle. No favours expected from this draw. Won't find this any harder and she can bounce back. TRY CATCHING ME (9) must be included on the back of some solid recent form, most recently when third at Tamworth over 1980m.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "1db9cab0-b747-11ea-80cf-6a390f79827e",
            name: "Fast",
            shortName: "fast"
        ),
        trackConditionId: "1db9cab0-b747-11ea-80cf-6a390f79827e",
        weather: .init(
            iconUri: "Fine",
            id: "01994c9e-3b74-11e8-a5eb-06a5c6d9a756",
            name: "Fine",
            shortName: "fine"
        ),
        weatherId: "01994c9e-3b74-11e8-a5eb-06a5c6d9a756"
    )

    static let raceForm2 = RaceForm(
        additionalData: .additionalData2,
        distance: 366,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "EMERALD BAY (9) was prominent on straightening and stuck on well to finish third last start over 320m at Group 3 level at this track (Dirt), beaten 1.3 lengths. Perfectly placed and is sure to be there at the finish. FLYING POLICY 123 (7) returns from a spell of five months and did score first-up when last in work at Will Rogers Downs (Dirt) over 320m. Lines up for the first time for the Justin W Joiner stable. Has ability and should be right in the finish. QUEEN SIN TACHA (8) returns from a spell of five months and did score first-up when last in work at this track (Dirt) over 229m. Lines up for the first time for the Ramon Mendoza stable. Can measure up at the first run for a new barn. SHEZ AN OUTGOING GAL (2) returned from a spell four weeks ago when she was beaten 10 lengths into tenth over 302m at this track. Fitter so a likely improver.",
        raceCommentAlternative: "EMERALD BAY (9) was prominent on straightening and stuck on well to finish third last start over 320m at Group 3 level at this track (Dirt), beaten 1.3 lengths. Perfectly placed and is sure to be there at the finish. FLYING POLICY 123 (7) returns from a spell of five months and did score first-up when last in work at Will Rogers Downs (Dirt) over 320m. Lines up for the first time for the Justin W Joiner stable. Has ability and should be right in the finish. QUEEN SIN TACHA (8) returns from a spell of five months and did score first-up when last in work at this track (Dirt) over 229m. Lines up for the first time for the Ramon Mendoza stable. Can measure up at the first run for a new barn. SHEZ AN OUTGOING GAL (2) returned from a spell four weeks ago when she was beaten 10 lengths into tenth over 302m at this track. Fitter so a likely improver.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "045cea71-a641-11e7-ba1d-066a01c9ce6e",
            name: "Firm",
            shortName: "firm"
        ),
        trackConditionId: "045cea71-a641-11e7-ba1d-066a01c9ce6e",
        weather: .init(
            iconUri: "Fine",
            id: "01994c9e-3b74-11e8-a5eb-06a5c6d9a756",
            name: "Fine",
            shortName: "fine"
        ),
        weatherId: "01994c9e-3b74-11e8-a5eb-06a5c6d9a756"
    )

    static let raceForm3 = RaceForm(
        additionalData: .additionalData3,
        distance: 1200,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "MR HILTON (1) just ran into one better in town at the latest effort and should find this assignment a touch easier. Drawn to get all the favours from the inside alley and is sure to be right there when the whips are cracking. BOOMTOWN LADDIE (8) will be better off for that first-up run and gets the services of Rodd in the irons. Is sure to have come on with that run under his belt and with a smart ride, he can play a major role. PRINCE PIER (2) has come along nicely at the trials and should be sharp away with the blinkers on. Can make a bright start for the Hoysted team. WAR IS BRUTAL (14) looks to have come on nicely during the break and is worth including. Thompson's booking is a good push for her chances.",
        raceCommentAlternative: "MR HILTON (1) just ran into one better in town at the latest effort and should find this assignment a touch easier. Drawn to get all the favours from the inside alley and is sure to be right there when the whips are cracking. BOOMTOWN LADDIE (8) will be better off for that first-up run and gets the services of Rodd in the irons. Is sure to have come on with that run under his belt and with a smart ride, he can play a major role. PRINCE PIER (2) has come along nicely at the trials and should be sharp away with the blinkers on. Can make a bright start for the Hoysted team. WAR IS BRUTAL (14) looks to have come on nicely during the break and is worth including. Thompson's booking is a good push for her chances.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "60bf7189-a7ba-11e7-96c3-0656c85e309e",
            name: "Heavy9",
            shortName: "heavy9"
        ),
        trackConditionId: "60bf7189-a7ba-11e7-96c3-0656c85e309e",
        weather: .init(
            iconUri: "Overcast",
            id: "0b43a420-3b75-11e8-a5eb-06a5c6d9a756",
            name: "Overcast",
            shortName: "overcast"
        ),
        weatherId: "0b43a420-3b75-11e8-a5eb-06a5c6d9a756"
    )

    static let raceForm4 = RaceForm(
        additionalData: .additionalData4,
        distance: 425,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "RED HOT DIVA (8) placed on debut by 2.75 lengths (23.86) at this track over 425m. Shows promise and can open winning account this time. LITTLE AMIGO (3) shapes well after a decent run last time, finishing third in a Maiden H at this track in 24.03. This tougher but looks a leading chance again. WAVE IN SEA (1) looks an each-way chance.",
        raceCommentAlternative: "RED HOT DIVA (8) placed on debut by 2.75 lengths (23.86) at this track over 425m. Shows promise and can open winning account this time. LITTLE AMIGO (3) shapes well after a decent run last time, finishing third in a Maiden H at this track in 24.03. This tougher but looks a leading chance again. WAVE IN SEA (1) looks an each-way chance.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
            name: "Good",
            shortName: "good"
        ),
        trackConditionId: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
        weather: .init(
            iconUri: "Fine",
            id: "01994c9e-3b74-11e8-a5eb-06a5c6d9a756",
            name: "Fine",
            shortName: "fine"
        ),
        weatherId: "01994c9e-3b74-11e8-a5eb-06a5c6d9a756"
    )

    static let raceForm5 = RaceForm(
        additionalData: .additionalData5,
        distance: 1400,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "EAGLE MOON (1) mixed his form last campaign but did produce some efforts that would stack right up for this, only beaten a long neck in one of his runs at Strathalbyn. Looks to have come on nicely during the break, winning his most recent trial. Expecting him to hit the ground running. GLOBAL OUTCAST (11) was narrowly beaten at a huge quote last time out, finishing third over this trip at Mt Gambier. Expect her to drift back again and be saved for the final shot at them under the light weight. HEIDI HIGH (8) has come along nicely in her jumpouts and can make a bright start without surprising. JAMAICA STAR (9) couldn't live up to market expectation on debut but is a likely improver.",
        raceCommentAlternative: "EAGLE MOON (1) mixed his form last campaign but did produce some efforts that would stack right up for this, only beaten a long neck in one of his runs at Strathalbyn. Looks to have come on nicely during the break, winning his most recent trial. Expecting him to hit the ground running. GLOBAL OUTCAST (11) was narrowly beaten at a huge quote last time out, finishing third over this trip at Mt Gambier. Expect her to drift back again and be saved for the final shot at them under the light weight. HEIDI HIGH (8) has come along nicely in her jumpouts and can make a bright start without surprising. JAMAICA STAR (9) couldn't live up to market expectation on debut but is a likely improver.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "908a410f-ab10-11e7-85e3-0641c90711b8",
            name: "Good3",
            shortName: "good3"
        ),
        trackConditionId: "908a410f-ab10-11e7-85e3-0641c90711b8",
        weather: .init(
            iconUri: "FINE",
            id: "08e5f78c-1a36-11eb-9269-cef03e67f1a3",
            name: "FINE",
            shortName: "fine"
        ),
        weatherId: "08e5f78c-1a36-11eb-9269-cef03e67f1a3"
    )

    static let raceForm6 = RaceForm(
        additionalData: .additionalData6,
        distance: 201,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "AP EAGLE HEART (5) stepped out for the first time last start and was just fair in finishing seventh at this track (Dirt) over 201m, beaten 4.5 lengths. Worth following up with that first run out of the way. QUITE PERFECT (3) is on debut for the Juan G Aleman stable. Two-year-old colt by Golden Boi from Nearly Perfect. Should acquit himself well. Keep an eye out for any positive market movement. AJ MILLION SIGN (6) is a superbly bred two-year-old colt lining up for the first time. By Apollitical Jess from Signs Zoomer who has produced some fine gallopers, including a winner at the elite level. CCR TRAIN STATION (4) is a two-year-old colt on debut from the stable of Sergio Morfin. By Freighttrain B from Wrap You Up. Pay to watch for any positive betting moves.",
        raceCommentAlternative: "AP EAGLE HEART (5) stepped out for the first time last start and was just fair in finishing seventh at this track (Dirt) over 201m, beaten 4.5 lengths. Worth following up with that first run out of the way. QUITE PERFECT (3) is on debut for the Juan G Aleman stable. Two-year-old colt by Golden Boi from Nearly Perfect. Should acquit himself well. Keep an eye out for any positive market movement. AJ MILLION SIGN (6) is a superbly bred two-year-old colt lining up for the first time. By Apollitical Jess from Signs Zoomer who has produced some fine gallopers, including a winner at the elite level. CCR TRAIN STATION (4) is a two-year-old colt on debut from the stable of Sergio Morfin. By Freighttrain B from Wrap You Up. Pay to watch for any positive betting moves.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "045cea71-a641-11e7-ba1d-066a01c9ce6e",
            name: "Firm",
            shortName: "firm"
        ),
        trackConditionId: "045cea71-a641-11e7-ba1d-066a01c9ce6e",
        weather: .init(
            iconUri: "FINE",
            id: "08e5f78c-1a36-11eb-9269-cef03e67f1a3",
            name: "FINE",
            shortName: "fine"
        ),
        weatherId: "08e5f78c-1a36-11eb-9269-cef03e67f1a3"
    )

    static let raceForm7 = RaceForm(
        additionalData: .additionalData7,
        distance: 512,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "JETSON (8) ran below best last time finishing fifth (26.20) over 455m at Murray Bridge from Box 5. Form from his last run is proving to be solid. Has claims if he runs up to expectations. TAKE A LITTLE (7) ran below her best last time finishing fourth (29.63) over 512m at this track in a OPEN. Form at the trip sound including seven wins. Has good speed and will be prominent from out wide. Likely to be about the money. MEPUNGA INFRARED (1) was out of in the placings when seventh last time but three runs back posted a brilliant 29.68 win over 512m at this track. Rates a leading chance if runs up to recent winning time. CHUCK A PARTY (2) can improve on an unplaced run here last time out.",
        raceCommentAlternative: "JETSON (8) ran below best last time finishing fifth (26.20) over 455m at Murray Bridge from Box 5. Form from his last run is proving to be solid. Has claims if he runs up to expectations. TAKE A LITTLE (7) ran below her best last time finishing fourth (29.63) over 512m at this track in a OPEN. Form at the trip sound including seven wins. Has good speed and will be prominent from out wide. Likely to be about the money. MEPUNGA INFRARED (1) was out of in the placings when seventh last time but three runs back posted a brilliant 29.68 win over 512m at this track. Rates a leading chance if runs up to recent winning time. CHUCK A PARTY (2) can improve on an unplaced run here last time out.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
            name: "Good",
            shortName: "good"
        ),
        trackConditionId: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
        weather: .init(
            iconUri: "FINE",
            id: "08e5f78c-1a36-11eb-9269-cef03e67f1a3",
            name: "FINE",
            shortName: "fine"
        ),
        weatherId: "08e5f78c-1a36-11eb-9269-cef03e67f1a3"
    )

    static let raceForm8 = RaceForm(
        additionalData: .additionalData8,
        distance: 1800,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "ALLEN STAR (2) was comfortably accounted for when second last start over 1900m at Kyoto Dirt, beaten 5 lengths after being prominent at the corner. That followed a good win on debut at Kyoto Dirt. Promising colt with good pace and a low draw. Sure to go well. TENKA MUTEKI (3) was always forward and boxed on to finish third over 1800m at this track last time. Drawn to enjoy a nice trail just off the pace. Leading contender. GANDA (14) took advantage of the good draw and led for much of the way last start before being run down in the straight, finishing fourth and beaten 2.75 lengths over 1800m at this track. Among the main hopes. LICHTMUHLE (7) has been in the money at his last couple of runs, the latest when second over 1800m at Chukyo Dirt. Capable of testing this field.",
        raceCommentAlternative: "ALLEN STAR (2) was comfortably accounted for when second last start over 1900m at Kyoto Dirt, beaten 5 lengths after being prominent at the corner. That followed a good win on debut at Kyoto Dirt. Promising colt with good pace and a low draw. Sure to go well. TENKA MUTEKI (3) was always forward and boxed on to finish third over 1800m at this track last time. Drawn to enjoy a nice trail just off the pace. Leading contender. GANDA (14) took advantage of the good draw and led for much of the way last start before being run down in the straight, finishing fourth and beaten 2.75 lengths over 1800m at this track. Among the main hopes. LICHTMUHLE (7) has been in the money at his last couple of runs, the latest when second over 1800m at Chukyo Dirt. Capable of testing this field.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
            name: "Good",
            shortName: "good"
        ),
        trackConditionId: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
        weather: nil,
        weatherId: nil
    )

    static let raceForm9 = RaceForm(
        additionalData: .additionalData9,
        distance: 1200,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "DUNQUIN (6) raced on the speed but was just found wanting in the closing stages when third last start over 1400m at Scone. Pops back into an easier maiden today and reverting to 1200m is a positive. Ready to break through at start four. DEKKA'S LATEST (5) returns from a nine-month spell for new trainer David Hatch. Contested a Listed race at Flemington at his last run so the previous stable held him in high regard. Watch the betting carefully. Speedy mare JUST JOAN (10) generally leads for home but can't finish things off. Trifectas and first fours. GRANDE DIABLO (7) returns and looks best of the rest. Nock's booking needs to be respected.",
        raceCommentAlternative: "DUNQUIN (6) raced on the speed but was just found wanting in the closing stages when third last start over 1400m at Scone. Pops back into an easier maiden today and reverting to 1200m is a positive. Ready to break through at start four. DEKKA'S LATEST (5) returns from a nine-month spell for new trainer David Hatch. Contested a Listed race at Flemington at his last run so the previous stable held him in high regard. Watch the betting carefully. Speedy mare JUST JOAN (10) generally leads for home but can't finish things off. Trifectas and first fours. GRANDE DIABLO (7) returns and looks best of the rest. Nock's booking needs to be respected.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "908a410f-ab10-11e7-85e3-0641c90711b8",
            name: "Good3",
            shortName: "good3"
        ),
        trackConditionId: "908a410f-ab10-11e7-85e3-0641c90711b8",
        weather: .init(
            iconUri: "FINE",
            id: "08e5f78c-1a36-11eb-9269-cef03e67f1a3",
            name: "FINE",
            shortName: "fine"
        ),
        weatherId: "08e5f78c-1a36-11eb-9269-cef03e67f1a3"
    )

    static let raceForm10 = RaceForm(
        additionalData: .additionalData10,
        distance: 366,
        distanceType: .init(
            id: "570775ae-09ec-42d5-989d-7c8f06366aa7",
            name: "Metres",
            shortName: "m"
        ),
        distanceTypeId: "570775ae-09ec-42d5-989d-7c8f06366aa7",
        generated: 1,
        raceComment: "SALSA (2) hit the ground running to score by 7 lengths (19.62) at this track over 366m. Can use the low draw to advantage. Can make it back to back wins. Can continue winning ways. OHTANI MAGIC (1) drew this same box last time when in the minors (20.02) in a Maiden over 366m at this track. With a good start should be able to take advantage of the rails draw. This tougher but looks a leading chance again. OHTANI FORCE (3) eye-catching debut run after settling well back but winding up strongly into the frame when second (20.17) at this track over 366m. This looks easier and expected to improve further. HELLO GEMINI (5) hit the frame here last time and looks a chance again.",
        raceCommentAlternative: "SALSA (2) hit the ground running to score by 7 lengths (19.62) at this track over 366m. Can use the low draw to advantage. Can make it back to back wins. Can continue winning ways. OHTANI MAGIC (1) drew this same box last time when in the minors (20.02) in a Maiden over 366m at this track. With a good start should be able to take advantage of the rails draw. This tougher but looks a leading chance again. OHTANI FORCE (3) eye-catching debut run after settling well back but winding up strongly into the frame when second (20.17) at this track over 366m. This looks easier and expected to improve further. HELLO GEMINI (5) hit the frame here last time and looks a chance again.",
        silkBaseUrl: "drr38safykj6s.cloudfront.net",
        trackCondition: .init(
            id: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
            name: "Good",
            shortName: "good"
        ),
        trackConditionId: "10a14653-a33d-11e7-810d-0a1a4ae29bd2",
        weather: .init(
            iconUri: "FINE",
            id: "08e5f78c-1a36-11eb-9269-cef03e67f1a3",
            name: "FINE",
            shortName: "fine"
        ),
        weatherId: "08e5f78c-1a36-11eb-9269-cef03e67f1a3"
    )
}

#endif
