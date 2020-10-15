//
//  SettingDoubleTableViewCell.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 19/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SettingDoubleTableViewCell: MasterTableViewCell {

    @IBOutlet weak var mainContainerview1: UIView!
    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var containerView1: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        containerView1.layer.cornerRadius = 20
        containerView2.layer.cornerRadius = 20
        mainContainerview1.layer.cornerRadius = 5
        mainContainerView.layer.cornerRadius = 5
        mainContainerview1.installShadow()
        mainContainerView.installShadow()
        containerView2.addShadow()
        containerView1.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configureUI(model:CellProtocol) {
        guard let model = model as? SettingDoubleCellModel else {
            return
        }
    
    }

}
