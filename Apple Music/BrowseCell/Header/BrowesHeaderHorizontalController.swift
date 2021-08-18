//
//  BrowesHeaderHorizontalController.swift
//  Apple Music
//
//  Created by Abdallah on 8/17/21.
//

import UIKit
import SafariServices
extension BrowseReusableView : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
        
    }
    

    fileprivate func configureCollection(){
        collectionViewBrowseReusableView.delegate = self
        collectionViewBrowseReusableView.dataSource = self
        let nib = UINib(nibName: Constant.browseHeaderHorizontalCell, bundle: nil)
        collectionViewBrowseReusableView.register(nib, forCellWithReuseIdentifier: Constant.browseHeaderHorizontalCell)
        snapHorizontal()
    }
    
    
    fileprivate func snapHorizontal(){
        collectionViewBrowseReusableView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        collectionViewBrowseReusableView.decelerationRate = .fast
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        collectionViewBrowseReusableView.collectionViewLayout = layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topSong.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.browseHeaderHorizontalCell, for: indexPath) as! BrowseHeaderHorizontalCell
        cell.set(result: topSong[indexPath.item])
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 48, height: frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    

}
