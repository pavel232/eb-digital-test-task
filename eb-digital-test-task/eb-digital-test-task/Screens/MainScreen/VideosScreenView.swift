//
//  MainScreenView.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI

struct VideosScreenView: View {
    @State var viewModel: MainScreenViewModel
    
    var body: some View {
        TabView(selection: $viewModel.selectedScreenIndex) {
            ForEach(Array(zip(viewModel.videos.indices, viewModel.videos)), id: \.0) { ind, video in
                
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

fileprivate struct


#Preview {
    let loadDataService = LoadDataService()
    VideosScreenView(viewModel: MainScreenViewModel(loadDataService: loadDataService))
}
