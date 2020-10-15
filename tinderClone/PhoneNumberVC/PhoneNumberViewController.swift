//
//  PhoneNumberViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 24/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class PhoneNumberViewController: UIViewController , UITextFieldDelegate{
    let phoneNumberObjt = PhoneNumberVCPresenter()
    
    @IBOutlet weak var continuebtnBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var continuebtn: UIButton!
    @IBOutlet weak var verificationInfolbl: UILabel!
    @IBOutlet weak var selectCountryCodebtn: UIButton!
    @IBOutlet weak var phoneNumbertxtField: UITextField!
    
    let buttonCustomization = ButtonCustomization()
    override func viewDidLoad() {
        super.viewDidLoad()
            //continuebtn.isEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        let leftBarBtn = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(popVc))
        leftBarBtn.tintColor = .gray
        
        navigationItem.leftBarButtonItem = leftBarBtn
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        verificationInfolbl.text = verificationInfo
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        phoneNumbertxtField.becomeFirstResponder()
        buttonCustomization.setRadius(button: continuebtn, radius: 25, borderWidth: 1.5, borderColor: UIColor.white.cgColor)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    @objc func popVc(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let otpVC = storyBoard.instantiateViewController(identifier: otpverificationVCid) as? OTPVerificationViewController else {
            return
        }
        var phone = phoneNumbertxtField.text ?? ""
        phoneNumbertxtField.text = "7073088240"
        if phoneNumberObjt.isValidPhone(phone: "7073088240"){
           
            otpVC.phoneNumber = phone
            self.navigationController?.pushViewController(otpVC, animated: true)
        }
}
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let phone = (phoneNumbertxtField.text ?? "") + string
        if string == "" {
            continuebtn.isEnabled = false
            return true
        }
        if phone.count <= 10 {
            if phone.count == 10 {
                continuebtn.applyGradientToButton()
                print(phone)
                continuebtn.isEnabled = true
            }
            return true
        }
        return false
    }
    
    @objc func keyboardWillShow(notification : NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                let height = keyboardSize.height
                //print("****\(height)")
                //print(continuebtnBottomConstraint.constant)
                continuebtnBottomConstraint.constant = height + 20
                UIView.animate(withDuration: 0.1) {
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @IBAction func selectCountryCodebtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let countryCodeVC = storyBoard.instantiateViewController(withIdentifier: countryCodeVCIdentifier) as? CountryCodeViewController else {
            return
        }
        let navigationVC = UINavigationController(rootViewController: countryCodeVC)
        countryCodeVC.selectedCountryDelegate = self
        self.present(navigationVC, animated: true, completion: nil)
    }
}

extension PhoneNumberViewController : SelectedCountryProtocol {
    func selectedCountry(model: CountryCode) {
        selectCountryCodebtn.setTitle("\(model.isoCode)\(model.countryCode)", for: .normal)
        
    }
    
}
