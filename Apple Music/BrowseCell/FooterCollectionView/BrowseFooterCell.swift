//
//  BrowseFooterCell.swift
//  Apple Music
//
//  Created by Abdallah on 8/18/21.
//

import UIKit
import SDWebImage
class BrowseFooterCell: UICollectionViewCell {

    @IBOutlet weak var imageArtist: UIImageView!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(result : Results){
        imageArtist.sd_setImage(with: URL(string: result.artworkUrl100 ?? ""))
        
        collectionName.text    = result.name
        artistName.text        = result.kind
    }
}
