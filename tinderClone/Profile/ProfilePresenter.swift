//
//  ProfilePresenter.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 10/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit
class ProfilePresenter {
    
    func getAppInfo() -> [AppInformation]{
        var arr = [AppInformation]()
        for i in 0..<7 {
            let appInfo = AppInformation.init(infoImageName: infoImage[i], infoTitle: infoTitle[i], infoDescription: infoDescription[i],selectedPageColor: color[i])
            arr.append(appInfo)
        }
        return arr
    }
    
   
    
    
}
