//
//  AppInfoCollectionViewCell.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 10/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class AppInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoDescriptionLbl: UILabel!
    
    override class func awakeFromNib() {
        
    }
}
