//
//  InitialViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 22/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    @IBOutlet weak var backbtn: UIButton!
    
    @IBOutlet weak var signInWithGooglebtn: UIButton!
    @IBOutlet weak var signInWithFacebookbtn: UIButton!
    @IBOutlet weak var signInWithApplebtn: UIButton!
    @IBOutlet weak var createAccountStackView: UIStackView!
    @IBOutlet weak var signInStackView: UIStackView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var troubleSigningInBtn: UIButton!
    @IBOutlet weak var termAndConditionLbl: UILabel!
    
    let buttonCustomization = ButtonCustomization()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainView.applyGradient()
        
        termAndConditionLbl.text = termAndConditions
        signInStackView.isHidden = true
        backbtn.isHidden = true
        buttonCustomization.setRadius(button: createAccountBtn, radius: 25, borderWidth: 1, borderColor: UIColor.white.cgColor)
        buttonCustomization.setRadius(button: signInBtn, radius: 25, borderWidth: 1.5, borderColor: UIColor.white.cgColor)
        buttonCustomization.setRadius(button: signInWithApplebtn, radius: 20, borderWidth: 1.5, borderColor: UIColor.white.cgColor)
        buttonCustomization.setRadius(button: signInWithGooglebtn, radius: 20, borderWidth: 1.5, borderColor: UIColor.white.cgColor)
        buttonCustomization.setRadius(button: signInWithFacebookbtn, radius: 20, borderWidth: 1.5, borderColor: UIColor.white.cgColor)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    @IBAction func createAccountbtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let phoneNumberVc = storyBoard.instantiateViewController(identifier: phoneNumberVCIdentifier)
        let navigationController = UINavigationController(rootViewController: phoneNumberVc)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
        
    }
    
    @IBAction func signInbtnAction(_ sender: Any) {
        // self.createAccountStackView.isHidden = true
        UIView.animate(withDuration: 5) {
            self.createAccountStackView.isHidden = true
            self.signInStackView.isHidden = false
            self.backbtn.isHidden = false
            self.signInStackView.layoutIfNeeded()
            self.createAccountStackView.layoutIfNeeded()
        }
    }
    @IBAction func backbtnAction(_ sender: Any) {
        UIView.animate(withDuration: 5) {
            self.createAccountStackView.isHidden = false
            self.signInStackView.isHidden = true
            self.backbtn.isHidden = true
        }
    }
    
    
}

