//
//  AppCoordinator.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI

@Observable final class AppCoordinator: CoordinatorProtocol {
    var path = NavigationPath()
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func back() {
        path.removeLast()
    }
    
    func goToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder func build(page: AppPages) -> some View {
        switch page {
        case .main:
            let loadDataService = LoadDataService()
            let viewModel = VideosScreenViewModel(loadDataService: loadDataService)
            VideosScreenView(viewModel: viewModel)
        }
    }
    
    func start() -> some View {
        build(page: .main)
    }
}
