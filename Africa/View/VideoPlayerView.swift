//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Eliezer Antonio on 11/02/24.
//

import AVKit
import SwiftUI

struct VideoPlayerView: View {
    // MARK: - PROPERTIES

    var videoSelected: String
    var videoTitle: String

    // MARK: - BODY

    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                //   Text(videoTitle)
            }.overlay(Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(.top, 6)
                .padding(.horizontal, 8),
                alignment: .topLeading)
        } //: Vstack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

#Preview {
    NavigationView {
        VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
}
