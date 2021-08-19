//
//  DetailsTableView.swift
//  Apple Music
//
//  Created by Abdallah on 8/19/21.
//

import UIKit

class DetailsTableView: UITableViewController {
    
   var  BrowseMusic = [Results]()
    var index : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNIBCell()
        tableViewDesign()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData(indexPath: index!)

    }
    func configureNIBCell(){
            let nib = UINib(nibName: Constant.detailsCell, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: Constant.detailsCell)
        }
    
    func fetchData(indexPath : Int ){
            self.showLoadingView()
//            NetworkManger.shared.getTopSongs {[weak self] result in
//                guard let self = self else{return}
//                self.dismissLoadingView()
//                switch result {
//                case .success(let response):
//
//                    self.BrowseMusic = response.feed?.results ?? []
//                    self.dismissLoadingView()
//                    DispatchQueue.main.async {
//                        self.title = response.feed?.title
//                        self.tableView.reloadData()
//                    }
//                case .failure(let error):
//                    self.dismissLoadingView()
//
//                    self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
//                }
//            }
    
            if indexPath == 0 {
        NetworkManger.shared.getTopAlbums {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
    
                self.BrowseMusic = response.feed?.results ?? []
                self.dismissLoadingView()
                DispatchQueue.main.async {
                    self.title = response.feed?.title
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.dismissLoadingView()
    
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
    
            }else  if indexPath == 1 {
        NetworkManger.shared.getNewReleases {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
    
                self.BrowseMusic = response.feed?.results ?? []
                self.dismissLoadingView()
                DispatchQueue.main.async {
                    self.title = response.feed?.title
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.dismissLoadingView()
    
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
            }else  if indexPath == 2 {
    
        NetworkManger.shared.getComingSoon {[weak self] result in
            guard let self = self else{return}
            self.dismissLoadingView()
            switch result {
            case .success(let response):
    
                self.BrowseMusic = response.feed?.results ?? []
                self.dismissLoadingView()
                DispatchQueue.main.async {
                    self.title = response.feed?.title
                    self.tableView.reloadData()
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
                    self.tableView.reloadData()
                }
            case .failure(let error):
                self.dismissLoadingView()
    
                self.showAlert(withTitle: "Some thing error", withMessage: error.rawValue)
            }
        }
    }
        }
    // MARK: - Table view data source
    //        let storyBoard : UIStoryboard = UIStoryboard(name: "Go", bundle:nil)
    //        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "sssss") as! sssss
  //  Daa present
    //        nextViewController.modalPresentationStyle = .automatic
    //        self.present(nextViewController, animated:true, completion:nil)
           // Da push
     //       self.show(nextViewController, sender: self)
    //table

 
        fileprivate func tableViewDesign() {
            tableView.tableFooterView = UIView()
            tableView.separatorStyle = .none
        }
  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return BrowseMusic.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.detailsCell) as! DetailsCell
        cell.set(result: BrowseMusic[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        goSafari(urlString: BrowseMusic[indexPath.row].url ?? "")
        
    }
}
