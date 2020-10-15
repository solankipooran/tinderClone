//
//  ButtonCustomize.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 24/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit

class ButtonCustomization {
    
    func setRadius(button : UIButton , radius : CGFloat, borderWidth : CGFloat ,borderColor :CGColor){
        button.layer.cornerRadius = radius
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = borderColor
    }
    
    func shadowToButton(button:UIButton){
        
    }
    
}
