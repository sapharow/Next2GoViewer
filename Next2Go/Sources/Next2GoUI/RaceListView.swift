//
//  ContentView.swift
//  Next2GoViewer
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import SwiftUI
import ViewModel

public struct RaceListView: View {

    let viewModel: RaceListViewModel

    /// Active races shown in the list.
    private var visibleRaceViewModels: [RaceViewModel] {
        viewModel.raceViewModels.filter { !$0.isExpired }
    }

    public var body: some View {
        List {
            ForEach(visibleRaceViewModels, id: \.id) { value in
                RaceView(viewModel: value)
            }
        }
        .animation(.default, value: visibleRaceViewModels.map(\.id))
        .refreshable {
            viewModel.refreshRaces()
        }
    }

    public init(viewModel: RaceListViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    // XCode 26.4 got a regression bug - Previews of the UI inside of the package do not work.
    // Bug is fixed in XCode 26.5 Beta 1
    RaceListView(viewModel: .preview)
}
