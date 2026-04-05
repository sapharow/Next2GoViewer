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

            Rectangle()
                .frame(height: 1)
                .opacity(0.25)

            // Track info
            TrackInfo(info: [
                .init(symbol: .pointToprightArrowTriangleBackwardToPointBottomleftScurvepathFill, text: viewModel.trackDistance),
                .init(symbol: .pawprintFill, text: viewModel.trackCondition),
                .init(symbol: .signpostRightAndLeftFill, text: viewModel.trackDirection),
                .init(symbol: .appleMeditate, text: viewModel.trackSurface)
            ])

            Rectangle()
                .frame(height: 1)
                .opacity(0.25)

            // Race timing
            HStack {
                if let startDateTime = viewModel.startDateTime {
                    Text(startDateTime)
                }
                Spacer()
                Text(viewModel.timeLeft)
                    .foregroundStyle(viewModel.isStarted ? .red : .primary)
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

    struct TrackInfo: View {
        struct TrackInfo: Hashable {
            let symbol: SFSymbol
            let text: String
        }
        let info: [TrackInfo]

        @Environment(\.dynamicTypeSize) private var size

        var body: some View {
            if size < .accessibility1 {
                HStack {
                    ForEach(info, id: \.self) { item in
                        TrackInfoItem(symbol: item.symbol, text: item.text)
                    }
                }
                .font(.footnote)
            } else {
                ForEach(info, id: \.self) { item in
                    TrackInfoItem(symbol: item.symbol, text: item.text)
                }
                .font(.footnote)
            }
        }
    }

    struct TrackInfoItem: View {
        let symbol: SFSymbol
        let text: String
        var body: some View {
            HStack {
                Image(systemSymbol: symbol)
                Text(text)
                    .fontWidth(.condensed)
            }
            .padding(.horizontal, 4)
        }
    }

}

#Preview {
    // XCode 26.4 got a regression bug - Previews of the UI inside of the package do not work.
    // Bug is fixed in XCode 26.5 Beta 1
    ScrollView {
        RaceView(viewModel: .preview)
//            .background(Color.red)
    }
}
