//
//  ContentView.swift
//  Next2GoViewer
//
//  Created by Iskandar Safarov on 4/4/2026.
//

import SwiftUI

public struct ContentView: View {
    public var body: some View {
        RaceView(viewModel: .preview)
    }

    public init() {
        // Intentionally left blank
    }
}

#Preview {
    // XCode 26.4 got a regression bug - Previews of the UI inside of the package do not work.
    // Bug is fixed in XCode 26.5 Beta 1
    ContentView()
}
