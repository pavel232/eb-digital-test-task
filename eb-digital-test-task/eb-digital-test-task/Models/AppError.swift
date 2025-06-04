//
//  AppError.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import Foundation

enum AppError: Error {
    case loadResourceFailed
    case other(String)
    case unknown
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .loadResourceFailed:
            return NSLocalizedString("Error.LoadResource", comment: "")
        case .other(let message):
            return message
        case .unknown:
            return NSLocalizedString("Error.Unknown", comment: "")
        }
    }
}
