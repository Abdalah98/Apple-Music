//
//  File.swift
//  Apple Music
//
//  Created by Abdallah on 8/17/21.
//

import Foundation
struct DataofSongs: Codable {
    let feed: Feed?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}
