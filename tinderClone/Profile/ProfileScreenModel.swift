//
//  ProfileScreenModel.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 10/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit



let infoImage = ["coin","lightning","star","pinLocation","key","undo","heart"]
let infoTitle = ["1 person likes you","Get matches faster","Stand out with super likes","Swipe around the world","Control your profile","I meant to swipe right","Increase your chances"]
let infoDescription = ["See them now with tinder gold","Boost your profile once a month","you're three time more likely to get a match!","Passport to anywhere with Tinder Plus!","Limit what other see with Tinder Plus","Get unlimited rewinds with Tinder Plus","Get unlimited likes with Tinder Plus"]
let color = [UIColor.yellow,UIColor.purple,UIColor.blue,UIColor.purple,UIColor.orange,UIColor.yellow,UIColor.sampleBlue]


struct AppInformation {
    let infoImageName:String
    let infoTitle:String
    let infoDescription:String
    let selectedPageColor:UIColor
    
    init(infoImageName:String ,infoTitle:String ,infoDescription:String, selectedPageColor:UIColor) {
        self.infoImageName = infoImageName
        self.infoTitle = infoTitle
        self.infoDescription = infoDescription
        self.selectedPageColor = selectedPageColor
    }
}




