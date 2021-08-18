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
    var callBack: (() ->())?
    var details = ""

    func set(result :Results){
//        for i in result.genres ?? []{
//            if !details.isEmpty{
//                details += ", "
//            }
        nameMusic.text = result.collectionName
        nameArtist.text = result.artistName
         //   nameArtist.text =  details

        imageMusic.sd_setImage(with: URL(string: result.artworkUrl100 ?? "" ))
    }

}

