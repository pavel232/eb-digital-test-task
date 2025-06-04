//
//  VideoPlayerData.swift
//  eb-digital-test-task
//
//  Created by Pavel on 3.06.25.
//

import AVKit

struct VideoPlayerData {
    var model: VideoModel
    var player = AVPlayer()
    var timeStamp = CMTime.zero
}
