//
//  VideoPlayer.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let player: AVPlayer
    
    init() {
        
    }
    
    var body: some View {
        VideoPlayer(player: player)
    }
}

#Preview {
    VideoPlayerView()
}
