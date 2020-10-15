//
//  ShowMeViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 04/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class ShowMeViewController: UIViewController {

    @IBOutlet weak var everyoenSelectBtn: UIButton!
    @IBOutlet weak var manSelectBtn: UIButton!
    @IBOutlet weak var womanSelectBTn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    
    let btnCustomizeObjt = ButtonCustomization()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        btnCustomizeObjt.setRadius(button: manSelectBtn, radius: 20, borderWidth: 1, borderColor: UIColor.gray.cgColor)
        btnCustomizeObjt.setRadius(button: womanSelectBTn, radius: 20, borderWidth: 1, borderColor: UIColor.gray.cgColor)
        btnCustomizeObjt.setRadius(button: everyoenSelectBtn, radius: 20, borderWidth: 1, borderColor: UIColor.gray.cgColor)
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
    }
    

}
