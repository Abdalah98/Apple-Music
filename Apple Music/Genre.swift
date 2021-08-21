//
//  Genre.swift
//  Apple Music
//
//  Created by Abdallah on 8/21/21.
//

import Foundation
// MARK: - Genre
struct Genre: Codable {
    let genreId: String?
    let name: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case genreId = "genreId"
        case name = "name"
        case url = "url"
    }
}
