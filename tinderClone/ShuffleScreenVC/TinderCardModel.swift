//
//  TinderCardModel.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 06/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit

struct TinderCardModel {
  let name: String
  let age: Int
  let occupation: String?
  let image: UIImage?
}

 let cardModels = [
  TinderCardModel(name: "Michelle",
                  age: 26,
                  occupation: "Graphic Designer",
                  image: UIImage(named: "michelle")),
  TinderCardModel(name: "Joshua",
                  age: 27,
                  occupation: "Business Services Sales Representative",
                  image: UIImage(named: "joshua")),
  TinderCardModel(name: "Daiane",
                  age: 23,
                  occupation: "Graduate Student",
                  image: UIImage(named: "daiane")),
  TinderCardModel(name: "Julian",
                  age: 25,
                  occupation: "Model/Photographer",
                  image: UIImage(named: "julian")),
  TinderCardModel(name: "Andrew",
                  age: 26,
                  occupation: nil,
                  image: UIImage(named: "andrew")),
  TinderCardModel(name: "Bailey",
                  age: 25,
                  occupation: "Software Engineer",
                  image: UIImage(named: "bailey")),
  TinderCardModel(name: "Rachel",
                  age: 27,
                  occupation: "Interior Designer",
                  image: UIImage(named: "rachel"))
]


enum SegmentViews: Int {
    case swipeCards = 0
    case topPicks = 1
}

enum PickOptions: Int {
    case like = 0
    case picks = 1
}

enum ShuffleOptions: Int {
    case undo = 1
    case pass
    case star
    case heart
    case lighting
}
