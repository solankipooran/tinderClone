//
//  EmailViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 30/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {
    
    let btnCustmizeOjt = ButtonCustomization()
    var continueBtn:UIButton?
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var informationLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let leftBarButton = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(popVC))
        leftBarButton.tintColor = .gray
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        informationLbl.text = infoLblTxt
        titleLbl.text = titleLblTxt
        emailTextField.becomeFirstResponder()
        navigationController?.navigationBar.isHidden = false
        guard let inputViewNib = Bundle.main.loadNibNamed("emailInputView", owner: self, options: nil)?.first as? EmailInputView else {
            return
        }
        continueBtn = inputViewNib.continueBtn
        emailTextField.inputAccessoryView = inputViewNib
        //inputViewNib.continueBtn.isEnabled = false
        inputViewNib.continueBtn.addTarget(self, action: #selector(continueBtnAction), for: .touchUpInside)
        
        btnCustmizeOjt.setRadius(button: inputViewNib.continueBtn, radius: 25, borderWidth: 1, borderColor: UIColor.white.cgColor)
        
    }
    
    override func viewDidLayoutSubviews() {
        continueBtn?.applyGradientToButton()
    }
    
    @objc func popVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func continueBtnAction(){
        let storyBoard = UIStoryboard(name: "Information", bundle: nil)
        let nameVc = storyBoard.instantiateViewController(identifier: nameVCID)
        self.navigationController?.pushViewController(nameVc, animated: true)
    }
    
    
    
    
}
