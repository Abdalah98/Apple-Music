//
//  BrowseFooterCollectionView.swift
//  Apple Music
//
//  Created by Abdallah on 8/18/21.
//

import UIKit

extension BrowseCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
    }
    
    fileprivate func configureCollection(){
        collectionBrowseCell.delegate = self
        collectionBrowseCell.dataSource = self
        let nib = UINib(nibName: Constant.browseFooterCell, bundle: nil)
        collectionBrowseCell.register(nib, forCellWithReuseIdentifier: Constant.browseFooterCell)
        snapHorizontal()
    }
    
    
    fileprivate func snapHorizontal(){
       collectionBrowseCell.contentInset = .init(top: 12, left: 10, bottom: 12, right: 10)
        collectionBrowseCell.decelerationRate = .fast
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        collectionBrowseCell.collectionViewLayout = layout
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSongs.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.browseFooterCell , for: indexPath) as! BrowseFooterCell
        cell.set(result: allSongs[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     //   return .init(width: (frame.width - 40 ) / 2    , height: ( frame.height - 44 ) / 2)
        return  CGSize(width: (frame.width - 40  ) / 2    , height: ( frame.width + 20 ) / 2 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            didSelectCell?(allSongs[indexPath.item])
    
    }
}
