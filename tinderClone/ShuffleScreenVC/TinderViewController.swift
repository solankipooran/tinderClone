//
//  TinderViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 06/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit
import Shuffle

class TinderViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var messageBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var tinderSegmentController: UISegmentedControl!
    @IBOutlet weak var cardSwipeViewScreen: UIView!

    
    
    var swipCardVC: SwipCardsViewController?
    var toppicksVC: TopPicksViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //topPicksViewScreen.isHidden = true
        configureSwipCardVc()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tinderSegmentController.selectedSegmentIndex = 0
        
    }
    
    func configureSwipCardVc() {
        let controller = storyboard!.instantiateViewController(withIdentifier: "SwipCardsViewController")
        addChild(controller)
        containerView.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        controller.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        controller.didMove(toParent: self)
        swipCardVC = controller as? SwipCardsViewController
        
    }
    
    func configureTopPicksVc() {
        let controller = storyboard!.instantiateViewController(withIdentifier: "TopPicksViewController")
        addChild(controller)
        containerView.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        controller.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        controller.didMove(toParent: self)
        toppicksVC = controller as? TopPicksViewController
        
    }
    

    
    override func viewDidLayoutSubviews() {
        tinderSegmentController.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.sampleTinder], for: UIControl.State.selected)
        //tinderSegmentController.backgroundColor = .red
    }
    
    @IBAction func tinderSegmentControllerAction(_ sender: Any) {
        switch (tinderSegmentController.selectedSegmentIndex) {
        case SegmentViews.swipeCards.rawValue:
            remove_ViewController(VController: swipCardVC)
            configureSwipCardVc()
            break
        case SegmentViews.topPicks.rawValue:
            remove_ViewController(VController: toppicksVC)
            configureTopPicksVc()
            break
        default:
            break
        }
        
    }
    
    func remove_ViewController(VController:UIViewController?) {
        if VController != nil {
            if self.view.subviews.contains(VController!.view) {
                VController!.view.removeFromSuperview()
                VController?.removeFromParent()
            }
        }
    }
    
}





