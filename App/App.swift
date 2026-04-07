//
//  Next2GoViewerApp.swift
//  Next2GoViewer
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import Next2GoUI
import SwiftUI
import ViewModel

@main
struct Next2GoViewerApp: App {
    let viewModel = RaceListViewModel()
    var body: some Scene {
        WindowGroup {
            RaceListView(viewModel: viewModel)
        }
    }
}
