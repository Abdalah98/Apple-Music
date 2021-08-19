//
//  DetailsCell.swift
//  Apple Music
//
//  Created by Abdallah on 8/19/21.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var avtarImage: UIImageView!
    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var kind: UILabel!
   
    func set(result : Results){
        avtarImage.sd_setImage(with: URL(string: result.artworkUrl100 ?? ""))
        
        songName.text    = result.name
        kind.text        = result.kind
    }
   
}
