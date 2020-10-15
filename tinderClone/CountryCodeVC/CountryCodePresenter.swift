//
//  CountryCodePresenter.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 28/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit

class CountryCodePresenter {
    
    func countryCode() -> [SectionCode] {
        var arr = [CountryCode]()
        var sectionFiltered = [SectionCode]()
        for i in 0..<countryName.count {
            let country = CountryCode.init(countryName: countryName[i], countryCode: countryCode1[i], isoCode: isoCode[i])
            arr.append(country)
        }
        
        for char in sectionHeader {
            let arr1 = arr.filter{$0.countryName.hasPrefix(char)}
            if arr1.isEmpty {
                continue
            }
            let section = SectionCode.init(sectionHeader: char, countries: arr1)
            sectionFiltered.append(section)
        }
        return sectionFiltered
    }
    
    func addBarButton(){
        
        
        
    }
    
}
