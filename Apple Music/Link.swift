//
//  LINK.swift
//  Apple Music
//
//  Created by Abdallah on 8/21/21.
//

import Foundation
// MARK: - Link
struct Link: Codable {
    let linkSelf: String?
    let alternate: String?

    enum CodingKeys: String, CodingKey {
        case linkSelf = "self"
        case alternate = "alternate"
    }
}
