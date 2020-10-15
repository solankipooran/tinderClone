//
//  CountryCodeViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 27/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

protocol SelectedCountryProtocol : class{
    func selectedCountry(model:CountryCode)
}

class CountryCodeViewController: UIViewController {
    
    var selectedCountryDelegate : SelectedCountryProtocol?
    let countryCodeObjt = CountryCodePresenter()
    var sectionFiltered = [SectionCode]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       sectionFiltered = countryCodeObjt.countryCode()
        navigationController?.navigationBar.shadowImage = UIImage()
        let btn = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target:self, action: #selector(dismissVC))
        btn.tintColor = .gray
        navigationItem.leftBarButtonItem = btn
    }
    
    @objc func dismissVC(){
        self.dismiss(animated: true, completion: nil)
    }
}

extension CountryCodeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionHeaderView = Bundle.main.loadNibNamed(countryCodeSectionHeaderViewId, owner: self, options: nil)?.first as? CountryCodeSectionHeaderView else {
            return UIView()
        }
        sectionHeaderView.sectionHeaderHeadinglbl.text = sectionFiltered[section].sectionHeader
        return sectionHeaderView as? UIView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionFiltered.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionFiltered[section].countries.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let  cell =  tableView.dequeueReusableCell(withIdentifier: countryCodeIdentifier) as? CountryCodeTableViewCell else {
            return UITableViewCell()
        }
        
        let codes = sectionFiltered[indexPath.section]
        cell.countryNamelbl.text = codes.countries[indexPath.row].countryName
        cell.countryCodelbl.text = codes.countries[indexPath.row].countryCode
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryModel = sectionFiltered[indexPath.section].countries[indexPath.row]
        selectedCountryDelegate?.selectedCountry(model: countryModel)
        self.dismiss(animated: true, completion: nil)
    }
    
}
