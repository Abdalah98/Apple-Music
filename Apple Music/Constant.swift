//
//  Constant.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import Foundation
enum URLS{
    static let country            = "us"
    static let resultsLimit       = "50"
    static let mediaType          = "apple-music"

    static let main               = "https://rss.itunes.apple.com/api/v1/\(country)/\(mediaType)/"
    
    
    static let topSongs           = main + "top-songs/all/\(resultsLimit)/explicit.json"
    static let topAlbums          = main + "top-albums/all/\(resultsLimit)/explicit.json"
    static let newReleases        = main + "new-releases/all/\(resultsLimit)/explicit.json"
    static let hotTracks          = main + "hot-tracks/all/\(resultsLimit)/explicit.json"
    static let comingSoon         = main + "coming-soon/all/\(resultsLimit)/explicit.json"
}

//https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json

enum Constant {
    
    static let browseHeaderHorizontalCell = "BrowseHeaderHorizontalCell"
    static let browseReusableView         = "BrowseReusableView"
    static let browseFooterCell           = "BrowseFooterCell"
    static let browseCell                 = "BrowseCell"
    static let detailsCell                 = "DetailsCell"

}

