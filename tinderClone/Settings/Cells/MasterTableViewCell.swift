//
//  MasterTableViewCell.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 19/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

protocol CellProtocol {
    var cellIdentifier: String { get set }
    
}

class MasterTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUI(model:CellProtocol) {
        
    }

}
