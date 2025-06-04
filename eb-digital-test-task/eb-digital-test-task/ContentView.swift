//
//  ContentView.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI

struct ContentView: View {
    @State var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.start()
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
}


#Preview {
    ContentView()
}
