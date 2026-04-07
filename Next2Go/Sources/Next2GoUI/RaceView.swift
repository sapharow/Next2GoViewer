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
        HStack {
            Capsule()
                .frame(width: 4)
                .foregroundStyle(viewModel.category.color)
            VStack(alignment: .leading) {
                title
                horizontalDivider
                TrackInfoView(info: viewModel.trackInfo)
                horizontalDivider
                startTime
            }
        }
    }

    private var title: some View {
        HStack(alignment: .top) {
            // Category icon
            viewModel.category.image
                .resizable()
                .scaledToFit()
                .frame(height: categoryIconSize)
                .padding(4)

            VStack(alignment: .leading) {
                // Title
                Text(viewModel.title)
                    .font(.title3)
                    .accessibilityLabel(viewModel.accessibilityRaceName)

                // Location info
                HStack {
                    Text(viewModel.location)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .accessibilityLabel(viewModel.accessibilityRaceLocation)
                }
            }
        }
        .accessibilityAddTraits(.isHeader)
    }

    private var startTime: some View {
        HStack {
            if let weather = viewModel.weather {
                Image(systemSymbol: weather.symbol)
                    .accessibilityLabel(weather.accessibilityLabel)
            }
            Spacer()
            Text(viewModel.countdown.label)
                .foregroundStyle(viewModel.isStarted ? .red : .primary)
                .accessibilityAddTraits(.updatesFrequently)
                .accessibilityLabel(viewModel.countdown.accessibilityLabel)
        }
    }

    private var horizontalDivider: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundStyle(viewModel.category.color)
            .opacity(0.25)
    }

}

#Preview {
    // XCode 26.4 got a regression bug - Previews of the UI inside of the package do not work.
    // Bug is fixed in XCode 26.5 Beta 1
    ScrollView {
        RaceView(viewModel: .preview)
    }
}
