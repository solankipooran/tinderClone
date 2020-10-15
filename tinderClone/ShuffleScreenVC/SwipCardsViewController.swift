//
//  SwipCardsViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 07/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit
import Shuffle

class SwipCardsViewController: UIViewController {

    @IBOutlet weak var swipeCardView: SwipeCardStack!
    @IBOutlet weak var lightingBtn: UIButton!
    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var starBtn: UIButton!
    @IBOutlet weak var passBtn: UIButton!
    @IBOutlet weak var undoBtn: UIButton!
    
    let btnCustomizeObjt = ButtonCustomization()
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeCardView.delegate = self
        swipeCardView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeButton()
    }
    
    func customizeButton() {
        btnCustomizeObjt.setRadius(button: undoBtn, radius: 30, borderWidth: 1, borderColor: UIColor.white.cgColor)
        btnCustomizeObjt.setRadius(button: passBtn, radius: 30, borderWidth: 1, borderColor: UIColor.white.cgColor)
        btnCustomizeObjt.setRadius(button: starBtn, radius: 30, borderWidth: 1, borderColor: UIColor.white.cgColor)
        btnCustomizeObjt.setRadius(button: heartBtn, radius: 30, borderWidth: 1, borderColor: UIColor.white.cgColor)
        btnCustomizeObjt.setRadius(button: lightingBtn, radius: 30, borderWidth: 1, borderColor: UIColor.white.cgColor)
        
    }

}

extension SwipCardsViewController : SwipeCardStackDataSource, SwipeCardStackDelegate {
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        card.footerHeight = 80
        card.swipeDirections = [.left, .up, .right]
        for direction in card.swipeDirections {
            card.setOverlay(TinderCardOverlay(direction: direction), forDirection: direction)
        }
        
        let model = cardModels[index]
        card.content = TinderCardContentView(withImage: model.image)
        let footer = TinderCardFooterView(withTitle: "\(model.name), \(model.age)", subtitle: model.occupation)
        footer.iButtonTarget = {
            print("d")
        }
        card.footer = footer
        return card
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return cardModels.count
    }
    
    
    @IBAction func shuffleOptionsActions(_ sender: UIButton) {
        didTapButton(button: sender)
    }
    
    func didTapButton(button: UIButton) {
        switch button.tag {
        case ShuffleOptions.undo.rawValue:
            swipeCardView.undoLastSwipe(animated: true)
        case ShuffleOptions.pass.rawValue:
            swipeCardView.swipe(.left, animated: true)
        case ShuffleOptions.star.rawValue:
            swipeCardView.swipe(.up, animated: true)
        case ShuffleOptions.heart.rawValue:
            swipeCardView.swipe(.right, animated: true)
        case ShuffleOptions.lighting.rawValue:
            swipeCardView.reloadData()
        default:
            break
        }
    }
}
