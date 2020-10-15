//
//  SexualOrientationViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 04/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SexualOrientationViewController: UIViewController {
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var sexualOrientationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        sexualOrientationTableView.separatorColor = UIColor.clear
    }
    
    @IBAction func continueBtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Information", bundle: nil)
        let showMeVC = storyBoard.instantiateViewController(identifier: showMeVcId)
        self.navigationController?.pushViewController(showMeVC, animated: true)
    }
    
    

}

extension SexualOrientationViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sexualOrientationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SexualOrientationTableViewCell", for: indexPath) as? SexualOrientationTableViewCell else {
            return UITableViewCell()
        }
        cell.sexualOrientationLbl.text = sexualOrientationArray[indexPath.row]
        return cell
    }
    
    
}
