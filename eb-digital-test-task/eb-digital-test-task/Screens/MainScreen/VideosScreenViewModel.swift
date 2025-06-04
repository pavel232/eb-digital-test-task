//
//  MainScreenViewModel.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI
import AVKit
import Combine

@Observable final class VideosScreenViewModel {
    var selectedScreenIndex: Int = 0
    var videos: [VideoPlayerData] = []
    var error: Error? = nil
    
    private let loadDataService: LoadDataServiceProtocol
    private var cancellables: Set<AnyCancellable> = .init()
    
    init(loadDataService: LoadDataServiceProtocol) {
        self.loadDataService = loadDataService
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    func loadData() {
        let data = loadDataService.loadData()
        /// для подгузки видео по страницам
//        videos = data.map { VideoPlayerData(model: $0) }
        
        /// для подгузки всех видео сразу
        for item in data {
            guard let url = item.url() else {
                error = AppError.loadResourceFailed
                return
            }
            
            let player = AVPlayer(url: url)
            videos.append(VideoPlayerData(model: item, player: player))
        }
    }
    
    func onViewAppear() {
        loadPlayer(for: selectedScreenIndex)
        startPalying(for: selectedScreenIndex)
        addPlayerObserver()
    }
    
    func loadPlayer(for index: Int) {
        guard index < videos.count && index >= 0 else { return }
        
        if let url = videos[index].model.url(), videos[index].player.currentItem == nil  {
            let item = AVPlayerItem(url: url)
            let player = videos[index].player
            player.replaceCurrentItem(with: item)
            player.seek(to: videos[index].timeStamp)
        }
    }
    
    func unloadPlayer(for index: Int) {
        guard index < videos.count && index >= 0 else { return }
        
        let player = videos[index].player
        videos[index].timeStamp = player.currentTime()
        player.pause()
        player.replaceCurrentItem(with: nil)
    }
    
    func nextVideo() {
        withAnimation {
            selectedScreenIndex = (selectedScreenIndex + 1) % videos.count
        }
    }
    
    func onChangePlayer(old: Int, new: Int) {
        pausePlayer(for: old)
        startPalying(for: new)
    }
    
    private func addPlayerObserver() {
        guard selectedScreenIndex < videos.count && selectedScreenIndex >= 0 else { return }
        
        NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
            .sink(receiveValue: { value in
                let player = self.videos[self.selectedScreenIndex].player
                player.seek(to: CMTime.zero)
                player.play()
            })
            .store(in: &cancellables)
    }
    
    private func startPalying(for index: Int) {
        guard index < videos.count && index >= 0 else { return }
        
        if videos[index].player.timeControlStatus == .paused {
            videos[index].player.play()
        }
    }
    
    private func pausePlayer(for index: Int) {
        guard index < videos.count && index >= 0 else { return }
        
        if videos[index].player.timeControlStatus == .playing {
            videos[index].player.pause()
        }
    }
}
