//
//  PhoneNumberVCPresenter.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 29/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit

class PhoneNumberVCPresenter {

    func isValidPhone(phone: String) -> Bool {
        if phone.count == 10 {
            let phoneRegex = "^[0-9]{6,14}$";
            let valid = NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phone)
            return valid
        } else {
            return false
        }
        
    }
}
