//
//  GenderViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 04/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {

    @IBOutlet weak var otherGenderBtn: UIButton!
    @IBOutlet weak var manGenderBtn: UIButton!
    @IBOutlet weak var womanGenderBtn: UIButton!
    @IBOutlet weak var selectCondtionBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
    let btnCustomizeObjt = ButtonCustomization()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnCustomizeObjt.setRadius(button: manGenderBtn, radius: 20, borderWidth: 1, borderColor: UIColor.gray.cgColor)
        btnCustomizeObjt.setRadius(button: womanGenderBtn, radius: 20, borderWidth: 1, borderColor: UIColor.gray.cgColor)
        btnCustomizeObjt.setRadius(button: otherGenderBtn, radius: 20, borderWidth: 1, borderColor: UIColor.gray.cgColor)
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Information", bundle: nil)
        let sexualOrientationVC = storyBoard.instantiateViewController(identifier: sexualOrietationVCId)
        self.navigationController?.pushViewController(sexualOrientationVC, animated: true)
    }
    
}
