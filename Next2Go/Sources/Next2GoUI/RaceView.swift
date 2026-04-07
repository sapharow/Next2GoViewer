//
//  ContentView.swift
//  Next2GoViewer
//
//  Created by Iskandar Safarov on 6/6/2026.
//

import SFSafeSymbols
import SwiftUI
import ViewModel

struct RaceView: View {

    let viewModel: RaceViewModel
    @Environment(\.dynamicTypeSize) private var size
    @ScaledMetric(relativeTo: .body) private var categoryIconSize: CGFloat = 32

    public var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                // Category icon
                VStack(alignment: .center) {
                    categoryImage
                        .resizable()
                        .scaledToFit()
                        .frame(height: categoryIconSize)
                        .padding(4)
                    Spacer()
                    if let weatherSymbol = viewModel.weatherSymbol {
                        Image(systemSymbol: weatherSymbol)
                    }
                }

                VStack(alignment: .leading) {
                    // Title
                    Text(viewModel.title)
                        .font(.title3)

                    // Location info
                    HStack {
                        Text(viewModel.location)
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(viewModel.accessibilityTitle)
            .accessibilityAddTraits(.isHeader)

            Rectangle()
                .frame(height: 1)
                .opacity(0.25)

            // Track info
            TrackInfoView(info: viewModel.trackInfo)

            Rectangle()
                .frame(height: 1)
                .opacity(0.25)

            // Race timing
            HStack {
                if let startDateTime = viewModel.startDateTime {
                    Text(startDateTime)
                }
                Spacer()
                Text(viewModel.countdown.label)
                    .foregroundStyle(viewModel.isStarted ? .red : .primary)
                    .accessibilityAddTraits(.updatesFrequently)
                    .accessibilityLabel(viewModel.countdown.accessibilityLabel)
            }

        }
        .padding()
    }

}

// MARK: - Convenient views

private extension RaceView {

    var categoryImage: Image {
        switch viewModel.category {
        case .greyhound:
            Image(.greyhound)
        case .harness:
            Image(.harness)
        case .horse:
            Image(.horse)
        }
    }

}

#Preview {
    // XCode 26.4 got a regression bug - Previews of the UI inside of the package do not work.
    // Bug is fixed in XCode 26.5 Beta 1
    ScrollView {
        RaceView(viewModel: .preview)
    }
}
