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
    @IBOutlet weak var copyRightLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      //  view.backgroundColor = UIColor(white: 1, alpha: 0.15)
      
        view.backgroundColor =  UIColor.black.withAlphaComponent(0.20)


    }
  
    
    func set(result :Results){
        imageMusic.sd_setImage(with: URL(string: result.artworkUrl100 ?? "" ))

        nameMusic.text = result.collectionName
        nameLabel.text = result.artistName
        copyRightLabel.text = result.copyright
        result.genres?.forEach({ i in
           nameArtist.text = i.name
       })
    }
}
//    nameArtist.text = result.artistName

