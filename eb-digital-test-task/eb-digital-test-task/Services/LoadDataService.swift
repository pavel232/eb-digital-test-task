//
//  LoadDataService.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import Foundation

final class LoadDataService: LoadDataServiceProtocol {
    /// Load videos data
    func loadData() -> [VideoModel] {
        /// return mock data
        return MockData().videosData
    }
}
