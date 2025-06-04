//
//  VideoPlayer.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @Environment(VideosScreenViewModel.self) var viewModel
    
    var videoData: VideoPlayerData
    var index: Int
    
    var body: some View {
        VStack {
            Text(videoData.model.name)
                .foregroundStyle(Color.primaryText)
            
            VideoPlayer(player: videoData.player)
            /// можно использовать постраничеую подгрузку и выгрузку видео, чтобы уменьшить нагрузку на память
//                .onAppear {
//                    viewModel.loadPlayer(for: index)
//                }
//                .onDisappear {
//                    viewModel.unloadPlayer(for: index)
//                }
        }
    }
}
