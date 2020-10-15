//
//  CountryCodeModel.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 27/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation



struct SectionCode {
    let sectionHeader: String
    let countries: [CountryCode]
    init(sectionHeader:String ,countries : [CountryCode] ) {
        self.sectionHeader = sectionHeader
        self.countries = countries
    }
}

struct CountryCode {
    let countryName: String
    let countryCode: String
    let isoCode: String
    init(countryName:String , countryCode:String , isoCode: String) {
        self.countryCode = countryCode
        self.countryName = countryName
        self.isoCode = isoCode
    }
}

let countryName = ["Afghanistan","Albania","Algeria","Bangladesh","Barbados","Canada","Dutch","Egypt","Franch"]
let countryCode1 = ["+91","+92","+94","+96","+912","+977","+912","+990","+9000"]
let isoCode = ["AF","AL","ALG","BANG","BAR","CND","DTH","EGY","FNH"]
let sectionHeader = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
