//
//  MainScreenViewModel.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import Observation

@Observable final class VideosScreenViewModel {
    var selectedScreenIndex: Int = 0
    var videos: [Video] = []
    
    private let loadDataService: LoadDataServiceProtocol
    
    init(loadDataService: LoadDataServiceProtocol) {
        self.loadDataService = loadDataService
    }
    
    func loadData() {
        videos = loadDataService.loadData()
    }
}
