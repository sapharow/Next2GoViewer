//
//  ContentView.swift
//  Next2GoViewer
//
//  Created by Iskandar Safarov on 6/6/2026.
//

import SFSafeSymbols
import SwiftUI
import ViewModel

extension RaceView {

    struct TrackInfoView: View {
        let info: [RaceViewModel.TrackInfo]

        @Environment(\.dynamicTypeSize) private var size

        var body: some View {
            if size < .accessibility1 {
                HStack {
                    ForEach(info, id: \.self) { item in
                        TrackInfoItemView(item: item)
                    }
                }
                .font(.footnote)
            } else {
                ForEach(info, id: \.self) { item in
                    TrackInfoItemView(item: item)
                }
                .font(.footnote)
            }
        }
    }

    struct TrackInfoItemView: View {
        let item: RaceViewModel.TrackInfo
        var body: some View {
            HStack {
                Image(systemSymbol: item.symbol)
                Text(item.label)
                    .fontWidth(.condensed)
            }
            .padding(.horizontal, 4)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(item.accessibilityLabel)
        }
    }

}
