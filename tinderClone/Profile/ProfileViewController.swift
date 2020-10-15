//
//  ProfileViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 10/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var myTinderPlusBtn: UIButton!
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var tinderInfoCollectionView: UICollectionView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var editInfoBtn: UIButton!
    @IBOutlet weak var addMediaBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var profileName: UILabel!
    
    let btnCustomizeObjt = ButtonCustomization()
    var tinderInfo = [AppInformation]()
    let presenter = ProfilePresenter()
    var index = 0
    var inForwardDirection = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tinderInfo = presenter.getAppInfo()
        // Do any additional setup after loading the view.
        startTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnCustomizeObjt.setRadius(button: editInfoBtn, radius: 35, borderWidth: 0.2, borderColor: UIColor.white.cgColor)
        btnCustomizeObjt.setRadius(button: settingBtn, radius:35 , borderWidth: 0.2, borderColor: UIColor.white.cgColor)
        btnCustomizeObjt.setRadius(button: addMediaBtn, radius: 50, borderWidth: 0.2, borderColor: UIColor.white.cgColor)
        btnCustomizeObjt.setRadius(button: myTinderPlusBtn, radius: 25, borderWidth: 0.0, borderColor: UIColor.white.cgColor)
       
        editInfoBtn.applyShadow(radius: 10, opacity: 1, offset: CGSize(width: 0, height: 3))
        
        settingBtn.applyShadow(radius: 10, opacity: 1, offset: CGSize(width: 0, height: 3))
        addMediaBtn.applyShadow(radius: 10, opacity: 1, offset: CGSize(width: 0, height: 3))
    
        roundedView.clipsToBounds = true
        roundedView.layer.cornerRadius = UIScreen.main.bounds.width / 2
        roundedView.layer.maskedCorners = [.layerMinXMaxYCorner , .layerMaxXMaxYCorner]
        roundedView.applyShadow(radius: 10.0, opacity: 1.0, offset: CGSize(width: 0, height: 3))
    }
    
    override func viewWillLayoutSubviews() {
        profileImage.layer.cornerRadius = 70
        profileImage.applyshadowWithCorner(containerView: imageContainerView, cornerRadious: 70)
        myTinderPlusBtn.applyShadow(radius: 10, opacity: 1, offset: CGSize(width: 0, height: 3))
    }
    
    
    override func viewDidLayoutSubviews() {
        addMediaBtn.applyGradientToButton(radius: 50)
    }
    
    @IBAction func settingBtnAction(_ sender: Any) {
    }
    @IBAction func addMediaBtnAction(_ sender: Any) {
    }
    @IBAction func editInfoBtnAction(_ sender: Any) {
    }
    
   

}

extension ProfileViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tinderInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppInfoCollectionViewCell", for: indexPath) as? AppInfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        let data = tinderInfo[indexPath.row]
        cell.infoImage.image = UIImage(named: data.infoImageName)
        cell.infoLbl.text = data.infoTitle
        cell.infoDescriptionLbl.text = data.infoDescription
        cell.pageController.currentPage = indexPath.row
        cell.pageController.currentPageIndicatorTintColor = data.selectedPageColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        return CGSize(width: screenSize.width - 10, height: 100)
    }
    
    func startTimer() {
        let _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(scrollToNextCell), userInfo: nil, repeats: true);
       }
    
    @objc func scrollToNextCell() {
        let items = tinderInfoCollectionView.numberOfItems(inSection: 0)
        if (items - 1) == index  {
            tinderInfoCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: UICollectionView.ScrollPosition.left, animated: true)
        } else {
            tinderInfoCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: UICollectionView.ScrollPosition.right, animated: true)
        }
        
        if inForwardDirection {
            if index == (items - 1) {
                index = 0
                inForwardDirection = false
            } else {
                index += 1
            }
        } else {
            if index == 0 {
                index += 1
                inForwardDirection = true
            } else {
                index = 0
            }
        }

    }

    
    
    
}
