//
//  SettingsViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 14/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var cellData: [SectionToCells] = []
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cellData = getdata()
        
    }
    
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData[section].cellsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if cellData[section].sectionHeaderTitle == nil {
            return 0
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if cellData[section].sectionFooterTitle == nil {
            return 0
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = Bundle.main.loadNibNamed("SettingHeaderView", owner: self, options: nil)?.first as? HeaderViewClass else {
            return nil
        }
        headerView.headerViewTitleLbl.text = cellData[section].sectionHeaderTitle
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = Bundle.main.loadNibNamed("SettingFooterView", owner: self, options: nil)?.first as? FooterViewClass else {
            return nil
        }
        footerView.footerViewTitleLbl.text = cellData[section].sectionFooterTitle
        return footerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cellData[indexPath.section]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellsArray[indexPath.row].cellIdentifier, for: indexPath) as? MasterTableViewCell else {
            return UITableViewCell()
        }
        cell.configureUI(model: model.cellsArray[indexPath.row])
        return cell
    }
    
    
}
