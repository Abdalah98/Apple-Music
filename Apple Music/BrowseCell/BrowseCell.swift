//
//  BrowseCell.swift
//  Apple Music
//
//  Created by Abdallah on 8/18/21.
//

import UIKit

class BrowseCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionBrowseCell: UICollectionView!
    
    var didSelectCell:((Results)->())?
    var didSelect:(()->())?
    var allSongs = [Results]()
   
    
    @IBAction func seeAllSongAction(_ sender: Any) {
        didSelect?()
    }
}
