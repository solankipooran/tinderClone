//
//  PickViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 07/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class PickViewController: UIViewController {
    
    let arr = ["andrew","bailey","daiane","joshua","julian","michelle","rachel","andrew","bailey","daiane","joshua","julian","michelle","rachel"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension PickViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopPicksCollectionViewCell", for: indexPath) as? TopPicksCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.layer.cornerRadius = 10
        cell.topPickImage.image = UIImage(named: arr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let deviceScreen = UIScreen.main.bounds
        return CGSize(width: deviceScreen.width / 2 - 30 , height: deviceScreen.height / 2.5 - 40 )
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TopPickCollectionReusableView", for: indexPath) as? TopPickCollectionReusableView else {
                fatalError("Invalid view type")
            }
            headerView.upgradeInfoLbl.text = upgradeInfo
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
}
