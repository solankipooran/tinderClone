//
//  TopPicksViewController.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 07/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class TopPicksViewController: UIViewController {

    @IBOutlet weak var pickContainerView: UIView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var pickBtn: UIButton!
    
    
    
    var likeVC: LikeViewController?
    var pickVC: PickViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLikeVc()
        likeBtn.setTitleColor(UIColor .black, for: .normal)
        
    }
    
    
    func configureLikeVc() {
        let controller = storyboard!.instantiateViewController(withIdentifier: "LikeViewController")
               addChild(controller)
               pickContainerView.addSubview(controller.view)
               controller.view.translatesAutoresizingMaskIntoConstraints = false
               controller.view.leadingAnchor.constraint(equalTo: pickContainerView.leadingAnchor).isActive = true
               controller.view.trailingAnchor.constraint(equalTo: pickContainerView.trailingAnchor).isActive = true
               controller.view.topAnchor.constraint(equalTo: pickContainerView.topAnchor).isActive = true
               controller.view.bottomAnchor.constraint(equalTo: pickContainerView.bottomAnchor).isActive = true
               controller.didMove(toParent: self)
               likeVC = controller as? LikeViewController
    }
    
    func configurePickVc() {
        let controller = storyboard!.instantiateViewController(withIdentifier: "PickViewController")
               addChild(controller)
               pickContainerView.addSubview(controller.view)
               controller.view.translatesAutoresizingMaskIntoConstraints = false
               controller.view.leadingAnchor.constraint(equalTo: pickContainerView.leadingAnchor).isActive = true
               controller.view.trailingAnchor.constraint(equalTo: pickContainerView.trailingAnchor).isActive = true
               controller.view.topAnchor.constraint(equalTo: pickContainerView.topAnchor).isActive = true
               controller.view.bottomAnchor.constraint(equalTo: pickContainerView.bottomAnchor).isActive = true
               controller.didMove(toParent: self)
               pickVC = controller as? PickViewController
    }
    
    @IBAction func pickBtnsAction(_ sender: UIButton) {
        switch sender.tag {
        case PickOptions.like.rawValue:
            likeBtn.setTitleColor(UIColor .black, for: .normal)
            pickBtn.setTitleColor(UIColor .gray, for: .normal)
            remove_ViewController(VController: pickVC)
            configureLikeVc()
            break
        case PickOptions.picks.rawValue:
            pickBtn.setTitleColor(UIColor .black, for: .normal)
            likeBtn.setTitleColor(UIColor .gray, for: .normal)
            remove_ViewController(VController: likeVC)
            configurePickVc()
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

