//
//  NameViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 31/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    let btnCustomizeOjt = ButtonCustomization()
    var continueBtn: UIButton?
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let inputView = Bundle.main.loadNibNamed("InputView", owner: self, options: nil)?.first as? InputView else {
            return
        }
        nameTextField.inputAccessoryView = inputView
        continueBtn = inputView.continueBTn
        continueBtn?.addTarget(self, action: #selector(continuebtnAction), for: .touchUpInside)
        nameTextField.becomeFirstResponder()
        btnCustomizeOjt.setRadius(button: inputView.continueBTn, radius: 25, borderWidth: 1, borderColor: UIColor.white.cgColor)
        
    }
    
    
    override func viewDidLayoutSubviews() {
        continueBtn?.applyGradientToButton()
    }
    
    @objc func continuebtnAction(){
        let storyBoard = UIStoryboard(name: "Information", bundle: nil)
        let dOBVc = storyBoard.instantiateViewController(identifier: DOBVcId)
        self.navigationController?.pushViewController(dOBVc, animated: true)
        
    }


}
