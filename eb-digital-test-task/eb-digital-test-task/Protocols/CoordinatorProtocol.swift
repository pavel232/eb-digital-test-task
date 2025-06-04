//
//  CoordinatorProtocol.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import SwiftUI

enum AppPages: Hashable {
    case main
}

@MainActor protocol CoordinatorProtocol {
    associatedtype AppPage: View
    associatedtype StartPage: View
    
    func push(page: AppPages) -> Void
    func back() -> Void
    func goToRoot() -> Void
    func build(page: AppPages) -> AppPage
    func start() -> StartPage
}
