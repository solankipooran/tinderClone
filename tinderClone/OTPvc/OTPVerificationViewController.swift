//
//  OTPViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 29/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class OTPVerificationViewController: UIViewController {
    
    let btnCustomize = ButtonCustomization()
    var otpDictionary : [UITextField : Int] = [:]
    var phoneNumber:String = ""
    
    @IBOutlet weak var resendOtpBtn: UIButton!
    @IBOutlet weak var phoneNumberLbl: UILabel!
    @IBOutlet var otpTextFieldCollection: [UITextField]!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var continueBtnBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCustomize.setRadius(button: continueBtn, radius: 25, borderWidth: 1, borderColor: UIColor.white.cgColor)
        //continueBtn.isEnabled = false
        otpTextFieldCollection.first?.becomeFirstResponder()
        phoneNumberLbl.text = phoneNumber
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        for index in 0 ..< otpTextFieldCollection.count{
            otpDictionary[otpTextFieldCollection[index]] = index
        }
        
        let leftBarBtn = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(popVc))
        leftBarBtn.tintColor = .gray
        
        navigationItem.leftBarButtonItem = leftBarBtn
        
    }
    
    @objc func popVc(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            if view.frame.origin.y == 0 {
                let height = keyboardSize.cgRectValue.height
                print("****\(height)")
                print(continueBtnBottomConstraint.constant)
                continueBtnBottomConstraint.constant = height + 20
                UIView.animate(withDuration: 0.1) {
                    self.view.layoutIfNeeded()
                }
                
            }
        }
    }
    @IBAction func continueBtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let emailVC = storyBoard.instantiateViewController(identifier: emailVCId)
        self.navigationController?.pushViewController(emailVC, animated: true)
        
    }
    
    
    
    
}
    

extension OTPVerificationViewController : UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = " "
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length == 0 {
            textField.text = string
            setNextResponder(otpDictionary[textField], direction: .right)
            return false
        }else if range.length == 1 {
            textField.text = " "
            setNextResponder(otpDictionary[textField], direction: .left)
            return false
        }
        return true
    }
    
    func setNextResponder(_ index : Int? , direction : Direction ){
        guard let index = index else {return}
        continueBtn.applyGradientToButton()
        continueBtn.isEnabled = true
        resendOtpBtn.isHidden = false
        if direction == .left {
            if index == 0 {
                return
            }
             _ = otpTextFieldCollection[(index - 1)].becomeFirstResponder()
        }else{
            if index == otpTextFieldCollection.count - 1 {
                return
            }
            _ = otpTextFieldCollection[(index + 1)].becomeFirstResponder()
        }
    }
}

