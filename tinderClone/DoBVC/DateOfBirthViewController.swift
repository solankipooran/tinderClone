//
//  DateOfBirthViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 31/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class DateOfBirthViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
     var inputAccessoryView2: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLbl.text = "My \nbirthday is"
        
        guard let inputViewNib = Bundle.main.loadNibNamed("InputView", owner: self, options: nil)?.first as? InputView else {
            return
        }
        inputAccessoryView2 = inputViewNib
        inputViewNib.continueBTn.addTarget(self, action: #selector(continueBtnAction), for: .touchUpInside)
        
    }
    var isUpdate = false
    
    @objc func continueBtnAction() {
        let storyBoard = UIStoryboard(name: "Information", bundle: nil)
        let genderVC = storyBoard.instantiateViewController(identifier: genderVCiD)
        self.navigationController?.pushViewController(genderVC, animated: true)
    }
    
}

extension DateOfBirthViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.inputAccessoryView = inputAccessoryView2
//        if !isUpdate {
//        //
//            isUpdate = true
//        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //textField.inputAccessoryView = nil
    }
}
