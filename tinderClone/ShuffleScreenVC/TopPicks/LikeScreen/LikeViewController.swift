//
//  LikeViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 07/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class LikeViewController: UIViewController {
    @IBOutlet weak var likeCollectionView: UICollectionView!
    
    var refresher: UIRefreshControl!
    let arr = ["andrew","bailey","daiane","joshua","julian","michelle","rachel","andrew","bailey","daiane","joshua","julian","michelle","rachel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshController()
        
        // Do any additional setup after loading the view.
    }
    
    func configureRefreshController() {
        self.refresher = UIRefreshControl()
        self.likeCollectionView.refreshControl = refresher
        self.refresher.attributedTitle = NSAttributedString(string: "Refresh")
        self.refresher.addTarget(self, action: #selector(loadLikeCollectionView), for: .valueChanged)
    }
    
    @objc func loadLikeCollectionView() {
        refresher.endRefreshing()
        
    }
    
    
}

extension LikeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeCollectionViewCell", for: indexPath) as? LikeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 10
        cell.likedImage.image = UIImage(named: arr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        return CGSize(width: screenSize.width / 2 - 30 , height: screenSize.height / 2.5 - 40)
    }
    
}
