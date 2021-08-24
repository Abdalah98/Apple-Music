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
   //     BrowseMusic.removeAll()
        
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
