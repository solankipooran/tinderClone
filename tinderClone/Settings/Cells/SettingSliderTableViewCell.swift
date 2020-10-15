//
//  SettingSliderTableViewCell.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 19/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SettingSliderTableViewCell: MasterTableViewCell {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
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
        guard let sliderModel = model as? SettingSliderCellModel else {
            return
        }
        titleLabel.text = sliderModel.title
        valueLabel.text = sliderModel.value
    }
    
}
