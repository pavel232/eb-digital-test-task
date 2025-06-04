//
//  Video.swift
//  eb-digital-test-task
//
//  Created by Pavel on 2.06.25.
//

import Foundation

struct VideoModel: Identifiable {
    var id = UUID()
    var name: String
    var fileName: String
    
    func url() throws -> URL {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp4") {
            return url
        } else {
            throw AppError.loadResourceFailed
        }
    }
}
