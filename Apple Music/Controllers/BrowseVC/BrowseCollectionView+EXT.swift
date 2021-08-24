//
//  BrowseCollectionView+EXT.swift
//  Apple Music
//
//  Created by Abdallah on 8/23/21.
//

import UIKit
extension BrowseVC :UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func configureCollectionHeader(){
        browseCollectionView.register(UINib.init(nibName:  Constant.browseReusableView, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constant.browseReusableView)
    }
    
    
    func configureCollectionCell(){
        let nib = UINib(nibName: Constant.browseCell, bundle: nil)
        browseCollectionView.register(nib, forCellWithReuseIdentifier: Constant.browseCell)
    }
    
    // MARK: Header
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constant.browseReusableView, for: indexPath) as! BrowseReusableView
        header.topSong = self.topSongs
        header.collectionViewBrowseReusableView.reloadData()
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height:240)
    }
    
    // MARK: footer
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BrowseMusic.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.browseCell, for: indexPath)  as! BrowseCell
        
        cell.titleLabel.text  =   self.BrowseMusic[indexPath.item].feed?.title
        cell.allSongs         =  self.BrowseMusic[indexPath.item].feed?.results ?? []
        
        cell.didSelectCell = { [weak self] FeedResult in
            self?.goSafari(urlString:FeedResult.artistUrl ?? "")
        }
        
        cell.didSelect = {
            if indexPath.item == 0 {
                self.pushViewController(indexPath: indexPath.item)
            }else if indexPath.item == 1 {
                self.pushViewController2(indexPath: indexPath.item)
            }else if indexPath.item == 2 {
                self.pushViewController(indexPath: indexPath.item)
            }
            else if indexPath.item == 3 {
                self.pushViewController2(indexPath: indexPath.item)
            }
            
        }
        
        cell.collectionBrowseCell.reloadData()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 500)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}
