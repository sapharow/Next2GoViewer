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

    public var body: some View {
        ScrollView {
            ForEach(viewModel.raceViewModels, id: \.id) { value in
                RaceView(viewModel: value)
            }
        }
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
