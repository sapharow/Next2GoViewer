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
        // Keeps the menu label stable
        // SwiftUI renders it wrong on iOS 26
        .compositingGroup()
    }

    public var body: some View {
        VStack {
            HStack {
                Spacer()
                filterMenu
                    .padding(.horizontal)
            }
            List {
                ForEach(viewModel.raceViewModels, id: \.id) { value in
                    RaceView(viewModel: value)
                }
            }
            .animation(.default, value: viewModel.raceViewModels.map(\.id))
            .refreshable {
                viewModel.refreshRaces()
            }
        }
    }

    public init(viewModel: RaceListViewModel) {
        self.viewModel = viewModel
    }
}

#if targetEnvironment(simulator)
#Preview {
    // Xcode 26.4 has a regression where package previews do not work
    // The fix is in Xcode 26.5 Beta 1
    RaceListView(viewModel: .preview)
}
#endif
