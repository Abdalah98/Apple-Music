//
//  BrowseVC.swift
//  Apple Music
//
//  Created by Abdallah on 8/16/21.
//

import UIKit
import SafariServices

class BrowseVC: UIViewController {
    
    @IBOutlet weak var browseCollectionView: UICollectionView!
    
    var BrowseMusic = [DataofSongs]()
    var topSongs    = [Results]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionHeader()
        configureCollectionCell()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        fetchDataHeader()

    }
    
    
    fileprivate func configureCollectionHeader(){
        browseCollectionView.register(UINib.init(nibName:  Constant.browseReusableView, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constant.browseReusableView)
    }
    
    
    fileprivate func configureCollectionCell(){
        let nib = UINib(nibName: Constant.browseCell, bundle: nil)
        browseCollectionView.register(nib, forCellWithReuseIdentifier: Constant.browseCell)
    }
    
    
    func pushViewController(indexPath : Int){
        let vc = DetailsTableView()
        vc.index = indexPath
        vc.navigationItem.title = "Browes"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func pushViewController2(indexPath : Int){
        let vc = DetailsCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
        vc.index = indexPath
        vc.navigationItem.title = "Browes"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    fileprivate func fetchDataHeader(){
        BrowseMusic.removeAll()

        NetworkManger.shared.getTopSongs {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
                
                self.topSongs = response.feed?.results ?? []
                self.dismissLoadingView()
                DispatchQueue.main.async {
                    self.browseCollectionView.reloadData()
                }
            case .failure(let error):
                self.dismissLoadingView()
                
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
    }
    
    
    fileprivate func fetchData(){
        self.showLoadingView()
        
        var group1 :DataofSongs?
        var group2 :DataofSongs?
        var group3 :DataofSongs?
        var group4 :DataofSongs?
        
        //help you sync your data fetches  all cell together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        NetworkManger.shared.getTopAlbums {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                group1 = response
            case .failure(let error):
                self.dismissLoadingView()
                
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
        
        dispatchGroup.enter()
        NetworkManger.shared.getNewReleases {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                group2 = response
            case .failure(let error):
                self.dismissLoadingView()
                
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
        
        dispatchGroup.enter()
        NetworkManger.shared.getHotTracks {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                group3 = response
            case .failure(let error):
                self.dismissLoadingView()
                
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
        dispatchGroup.enter()
        NetworkManger.shared.getComingSoon {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
                dispatchGroup.leave()
                group4 = response
            case .failure(let error):
                self.dismissLoadingView()
                
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
        
        //completion
        dispatchGroup.notify(queue: .main) {
            self.dismissLoadingView()
            
            print("Completed your dispatch group tasks..")
            
            if let group = group1{
                self.BrowseMusic.append(group)
            }
            if let group = group2{
                self.BrowseMusic.append(group)
            }
            if let group = group3{
                self.BrowseMusic.append(group)
            }
            if let group = group4{
                self.BrowseMusic.append(group)
            }
            
            self.browseCollectionView.reloadData()
        }
    }
    
}



extension BrowseVC :UICollectionViewDelegate , UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
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
