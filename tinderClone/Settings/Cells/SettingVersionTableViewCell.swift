//
//  SettingVersionTableViewCell.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 19/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SettingVersionTableViewCell: MasterTableViewCell {
    
    @IBOutlet weak var versionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func configureUI(model:CellProtocol) {
        guard let versionModel = model as? SettingVersionCellModel else {
            return
        }
        versionLabel.text = versionModel.version
    }
    
}
