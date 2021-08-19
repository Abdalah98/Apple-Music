//
//  BrowseHeaderHorizontalCell.swift
//  Apple Music
//
//  Created by Abdallah on 8/17/21.
//

import UIKit
import SDWebImage
class BrowseHeaderHorizontalCell: UICollectionViewCell {

    @IBOutlet weak var imageMusic: UIImageView!
    @IBOutlet weak var nameArtist: UILabel!
    @IBOutlet weak var nameMusic: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func set(result :Results){
        imageMusic.sd_setImage(with: URL(string: result.artworkUrl100 ?? "" ))

        nameMusic.text = result.collectionName
        nameLabel.text = result.artistName

        result.genres?.forEach({ i in
           nameArtist.text = i.name
       })
    }
}
//    nameArtist.text = result.artistName

