//
//  DemoRacesService+Races.swift
//  Next2Go
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Foundation
import Model

#if targetEnvironment(simulator)

extension Races {

    static let demoRaces = Races(
        nextToGo: [
            "bbb1fcfc-e979-4912-ab68-653f7b1e983d",
            "ba2f008b-23dd-4bc1-baf1-278e7f582a89",
            "9ac0064a-feb3-46f3-933b-6b0a33f1ca17",
            "b4ffb077-6088-4413-b802-5952bfc33b04",
            "6bd4c0c9-9d45-445c-a0d1-a2ba91473602",
            "d883b8ad-c9b6-4aee-aa77-bab028f2a37d",
            "853cf37a-82fe-4584-8f04-c30fe23229e8",
            "cdc6e0cf-086b-4867-af05-e03a7e463fb5",
            "1259bd42-107e-4557-a0a0-a44f710e1014",
            "30225c1a-828d-4320-b94b-41c32b7830ba"
        ],
        raceSummaries: [
            "bbb1fcfc-e979-4912-ab68-653f7b1e983d": .race1,
            "ba2f008b-23dd-4bc1-baf1-278e7f582a89": .race2,
            "9ac0064a-feb3-46f3-933b-6b0a33f1ca17": .race3,
            "b4ffb077-6088-4413-b802-5952bfc33b04": .race4,
            "6bd4c0c9-9d45-445c-a0d1-a2ba91473602": .race5,
            "d883b8ad-c9b6-4aee-aa77-bab028f2a37d": .race6,
            "853cf37a-82fe-4584-8f04-c30fe23229e8": .race7,
            "cdc6e0cf-086b-4867-af05-e03a7e463fb5": .race8,
            "1259bd42-107e-4557-a0a0-a44f710e1014": .race9,
            "30225c1a-828d-4320-b94b-41c32b7830ba": .race10
        ]
    )

}

#endif
