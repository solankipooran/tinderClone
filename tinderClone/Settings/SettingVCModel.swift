//
//  SettingVCModel.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 14/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation



struct SectionToCells {
    let sectionHeaderTitle: String?
    let sectionFooterTitle: String?
    let cellsArray: [CellProtocol]
}

struct SettingLogoCellModel: CellProtocol {
    var cellIdentifier: String = "SettingTinderLogoTableViewCell"
    let preImage: String
    let postImage: String
    let descrption: String
}

struct SettingDoubleCellModel:CellProtocol {
    var cellIdentifier: String = "SettingDoubleTableViewCell"
}

struct SettingBasicCellModel:CellProtocol {
    var cellIdentifier: String = "SettingBasicTableViewCell"
    let title: String
    let info: String?
}

struct SettingSliderCellModel:CellProtocol {
    var cellIdentifier: String = "SettingSliderTableViewCell"
    let title: String
    let value: String
}

struct SettingWithLabelCellModel:CellProtocol {
    var cellIdentifier: String = "SettingWithLabelTableViewCell"
    let title: String
    
}
struct SettingWithSwitchCellModel:CellProtocol {
    var cellIdentifier: String = "SettingWithSwitchTableViewCell"
    let title: String
}

struct SettingVersionCellModel:CellProtocol {
    var cellIdentifier: String = "SettingVersionTableViewCell"
    let version: String
}



func getdata() ->  [SectionToCells] {
    
    var sectionArray = [SectionToCells]()
    var cellArray = [CellProtocol]()
    
    cellArray.append(SettingLogoCellModel(preImage: "tinderGold", postImage: "coin", descrption: "Unlock our most exclusive features"))
    cellArray.append(SettingLogoCellModel(preImage: "tinderPink", postImage: "plus", descrption: "Unlimited likes & more"))
    let section0 = SectionToCells(sectionHeaderTitle: nil, sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section0)
    cellArray.removeAll()
    
    cellArray.append(SettingDoubleCellModel())
    let section01 = SectionToCells(sectionHeaderTitle: nil, sectionFooterTitle: "", cellsArray: cellArray)
    sectionArray.append(section01)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Phone Number", info: "number"))
    cellArray.append(SettingBasicCellModel(title: "Connected Account", info: nil))
    cellArray.append(SettingBasicCellModel(title: "Email", info: "@gmail"))
    let section1 = SectionToCells(sectionHeaderTitle: "ACCOUNT SETTING", sectionFooterTitle: "Verify an email to help secure your account.", cellsArray: cellArray)
    sectionArray.append(section1)
    cellArray.removeAll()
    
    
    cellArray.append(SettingBasicCellModel(title: "Location", info: "My Current location \nLoading..."))
    cellArray.append(SettingSliderCellModel(title: "Maximum distance", value: "84 km"))
    cellArray.append(SettingBasicCellModel(title: "Show Me", info: "Women"))
    cellArray.append(SettingSliderCellModel(title: "Age Range", value: "18-36"))
    cellArray.append(SettingWithSwitchCellModel(title: "Global"))
    let setion2 = SectionToCells(sectionHeaderTitle: "DISCOVERY", sectionFooterTitle: "Going global will allow you to see people from around the world, after you've run out of profiles nearby.", cellsArray: cellArray)
    sectionArray.append(setion2)
    cellArray.removeAll()
    
    cellArray.append(SettingWithSwitchCellModel(title: "Show me on Tinder"))
    let section3 = SectionToCells(sectionHeaderTitle: nil, sectionFooterTitle: "While turned off, you will not shown in card stack. People you have already liked may still see your profile and match with you.", cellsArray: cellArray)
    sectionArray.append(section3)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Manage Top Picks", info: "Settings"))
    let section4 = SectionToCells(sectionHeaderTitle: "TOP PICKS", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section4)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Manage Read Receipts", info: "Settings"))
    let section5 = SectionToCells(sectionHeaderTitle: "READ RECIPTS", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section5)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Manage Swipe Surge", info: "Settings"))
    let section6 = SectionToCells(sectionHeaderTitle: "SWIPE SURGE", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section6)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Shared content", info: nil))
    let section7 = SectionToCells(sectionHeaderTitle: "FEED SETTINGS", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section7)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Autoplay videos", info: nil))
    let section8 = SectionToCells(sectionHeaderTitle: "DATA USAGE", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section8)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Recently active status", info: nil))
    let section9 = SectionToCells(sectionHeaderTitle: "ACTIVE STATUS", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section9)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Username", info: "claims yours"))
    let section10 = SectionToCells(sectionHeaderTitle: "NOTIFICATIONS", sectionFooterTitle: "Pick which notifications to see while in the app.", cellsArray: cellArray)
    sectionArray.append(section10)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Email", info: nil))
    cellArray.append(SettingBasicCellModel(title: "Push notifications", info: nil))
    cellArray.append(SettingBasicCellModel(title: "Team Tinder", info: nil))
    let section11 = SectionToCells(sectionHeaderTitle: "NOTIFICATIONS", sectionFooterTitle: "Pick which notifications to see while in the app.", cellsArray: cellArray)
    sectionArray.append(section11)
    cellArray.removeAll()
    
    cellArray.append(SettingWithLabelCellModel(title: "Restore purchases"))
    let section12 = SectionToCells(sectionHeaderTitle: nil, sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section12)
    cellArray.removeAll()
    
    cellArray.append(SettingWithLabelCellModel(title: "Share Tinder"))
    let section17 = SectionToCells(sectionHeaderTitle: "", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section17)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Help & Support", info: nil))
    let section13 = SectionToCells(sectionHeaderTitle: "CONTACT US", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section13)
    cellArray.removeAll()
    
    cellArray.append(SettingBasicCellModel(title: "Privacy Policy", info: nil))
    cellArray.append(SettingBasicCellModel(title: "Terms of Service", info: nil))
    cellArray.append(SettingBasicCellModel(title: "Licences", info: nil))
    let section14 = SectionToCells(sectionHeaderTitle: "COMMUNITY", sectionFooterTitle: nil, cellsArray: cellArray)
    sectionArray.append(section14)
    cellArray.removeAll()
    
    cellArray.append(SettingWithLabelCellModel(title: "Log out"))
    cellArray.append(SettingVersionCellModel(version: "Version 11.19.0"))
    cellArray.append(SettingWithLabelCellModel(title: "Delete account"))
    let section15 = SectionToCells(sectionHeaderTitle: "", sectionFooterTitle: "", cellsArray: cellArray)
    sectionArray.append(section15)
    cellArray.removeAll()
    
    
    return sectionArray
}
    
