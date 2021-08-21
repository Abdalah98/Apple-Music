//
//  Author.swift
//  Apple Music
//
//  Created by Abdallah on 8/21/21.
//

import Foundation
// MARK: - Author
struct Author: Codable {
    let name: String?
    let uri: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case uri = "uri"
    }
}
