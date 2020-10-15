//
//  SettingTinderLogoTableViewCell.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 19/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SettingTinderLogoTableViewCell: MasterTableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var preImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        containerView.layer.cornerRadius = 20
        containerView.installShadow()
        separatorInset = UIEdgeInsets(top: 0, left: 1000, bottom: 0, right: 0)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func configureUI(model:CellProtocol) {
        guard let model = model as? SettingLogoCellModel else {
            return
        }
        preImage.image = UIImage(named: model.preImage)
        postImage.image = UIImage(named: model.postImage)
        descriptionLbl.text = model.descrption
    }
}


