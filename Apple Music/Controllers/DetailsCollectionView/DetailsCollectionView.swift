//
//  DetailsCollectionView.swift
//  Apple Music
//
//  Created by Abdallah on 8/21/21.
//

import UIKit


class DetailsCollectionView: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    
    var  BrowseMusic = [Results]()
    var index : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData(indexPath: index!)
        collectionView.backgroundColor = .systemBackground
    }
    
    fileprivate func configureCollection(){
        let nib = UINib(nibName: Constant.browseFooterCell, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: Constant.browseFooterCell)
    }
    
    
    func fetchData(indexPath : Int ){
        self.showLoadingView()
        
        if indexPath == 1 {
            
            NetworkManger.shared.getNewReleases {[weak self] result in
                guard let self = self else{return}
                self.dismissLoadingView()
                switch result {
                case .success(let response):
                    
                    self.BrowseMusic = response.feed?.results ?? []
                    self.dismissLoadingView()
                    DispatchQueue.main.async {
                        self.title = response.feed?.title
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    self.dismissLoadingView()
                    
                    self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
                }
            }
            
        }else  if indexPath == 3 {
            NetworkManger.shared.getHotTracks {[weak self] result in
                guard let self = self else{return}
                self.dismissLoadingView()
                switch result {
                case .success(let response):
                    
                    self.BrowseMusic = response.feed?.results ?? []
                    self.dismissLoadingView()
                    DispatchQueue.main.async {
                        self.title = response.feed?.title
                        self.collectionView.reloadData()
                    }
                case .failure(let error):
                    self.dismissLoadingView()
                    
                    self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
                }
            }
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BrowseMusic.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.browseFooterCell , for: indexPath) as! BrowseFooterCell
        cell.set(result: BrowseMusic[indexPath.item])
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // the width oh this var is the math calculate the screen now i needed 2 coulme in row ok  there is two coulme 16|coulme|16|coulme|16 the culculate of 3 * 16 ok
        let width = (view.frame.width - 3 * 16) / 2
        return CGSize(width: width, height: width + 55 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16 , bottom: 16, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goSafari(urlString: BrowseMusic[indexPath.row].url ?? "")
        
    }
}
