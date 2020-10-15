//
//  SexualOrientationTableViewCell.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 04/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SexualOrientationTableViewCell: UITableViewCell {

    @IBOutlet weak var sexualOrientationLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
