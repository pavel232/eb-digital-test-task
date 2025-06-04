//
//  MainScreenView.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI
import AVKit

struct VideosScreenView: View {
    @State var viewModel: VideosScreenViewModel
    
    var body: some View {
        VStack {
            TabView(selection: $viewModel.selectedScreenIndex) {
                ForEach(0..<viewModel.videos.count, id: \.self) { index in
                    VideoPlayerView(videoData: viewModel.videos[index], index: index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack {
                Spacer()
                Button("Common.Next", action: viewModel.nextVideo)
                    .padding()
                    .tint(Color.primaryText)
            }
            .padding(.bottom)
        }
        .background(.black)
        .ignoresSafeArea()
        .environment(viewModel)
        .onAppear {
            viewModel.loadData()
            viewModel.onViewAppear()
        }
        .onChange(of: viewModel.selectedScreenIndex) { oldValue, newValue in
            viewModel.onChangePlayer(old: oldValue, new: newValue)
        }
        .errorAlert(error: $viewModel.error)
    }
}


#Preview {
    let loadDataService = LoadDataService()
    VideosScreenView(viewModel: VideosScreenViewModel(loadDataService: loadDataService))
}
