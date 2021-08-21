//
//  Results.swift
//  Apple Music
//
//  Created by Abdallah on 8/21/21.
//

import Foundation
// MARK: - Result
struct Results: Codable {
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let collectionName: String?
    let kind: String?
    let copyright: String?
    let artistId: String?
    let contentAdvisoryRating: String?
    let artistUrl: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case releaseDate = "releaseDate"
        case name = "name"
        case collectionName = "collectionName"
        case kind = "kind"
        case copyright = "copyright"
        case artistId = "artistId"
        case contentAdvisoryRating = "contentAdvisoryRating"
        case artistUrl = "artistUrl"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
    }
}
