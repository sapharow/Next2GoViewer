//
//  ContentView.swift
//  Next2GoViewer
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Model
import SwiftUI
import ViewModel

public struct RaceListView: View {

    let viewModel: RaceListViewModel

    /// Active races shown in the list.
    private var visibleRaceViewModels: [RaceViewModel] {
        Array(
            viewModel.raceViewModels
                .filter { !$0.isExpired }
                .prefix(5)
        )
    }

    private var filterMenu: some View {
        Menu {
            ForEach(RaceCategory.allCases, id: \.self) { category in
                Button {
                    if viewModel.raceCategories.contains(category) {
                        viewModel.raceCategories.remove(category)
                    } else {
                        viewModel.raceCategories.insert(category)
                    }
                } label: {
                    if viewModel.raceCategories.contains(category) {
                        Label(category.name, systemSymbol: .checkmark)
                    } else {
                        Text(category.name)
                    }
                }
            }
        } label: {
            Label(viewModel.categoriesLabel, systemSymbol: .line3HorizontalDecreaseCircle)
        }
        .compositingGroup() // This works around SwiftUI bug in iOS 26
    }

    public var body: some View {
        VStack {
            HStack {
                Spacer()
                filterMenu
                    .padding(.horizontal)
            }
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
