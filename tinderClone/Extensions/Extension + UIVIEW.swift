//
//  Extension + Color.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 24/07/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyGradient() {
        let gradient = CAGradientLayer()
        let firstColor = UIColor(displayP3Red: 255/255, green: 50/255, blue: 107/255, alpha: 1).cgColor
        let secondColor = UIColor(displayP3Red: 255/255, green: 112/255, blue: 49/255, alpha: 1).cgColor
        gradient.colors = [secondColor,firstColor]   
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradientToButton(radius: CGFloat = 25) {
        let gradient = CAGradientLayer()
        let firstColor = UIColor(displayP3Red: 255/255, green: 50/255, blue: 107/255, alpha: 1).cgColor
        let secondColor = UIColor(displayP3Red: 255/255, green: 112/255, blue: 49/255, alpha: 1).cgColor
        gradient.name = "ButtonLayer"
        gradient.colors = [secondColor,firstColor]
        gradient.startPoint = CGPoint(x:0.0, y:0.5)
        gradient.endPoint = CGPoint(x:1.0, y:0.5)
        gradient.cornerRadius = radius
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
    

}

extension UIView {

  @discardableResult
  func anchor(top: NSLayoutYAxisAnchor? = nil,
              left: NSLayoutXAxisAnchor? = nil,
              bottom: NSLayoutYAxisAnchor? = nil,
              right: NSLayoutXAxisAnchor? = nil,
              paddingTop: CGFloat = 0,
              paddingLeft: CGFloat = 0,
              paddingBottom: CGFloat = 0,
              paddingRight: CGFloat = 0,
              width: CGFloat = 0,
              height: CGFloat = 0) -> [NSLayoutConstraint] {
    translatesAutoresizingMaskIntoConstraints = false

    var anchors = [NSLayoutConstraint]()

    if let top = top {
      anchors.append(topAnchor.constraint(equalTo: top, constant: paddingTop))
    }
    if let left = left {
      anchors.append(leftAnchor.constraint(equalTo: left, constant: paddingLeft))
    }
    if let bottom = bottom {
      anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom))
    }
    if let right = right {
      anchors.append(rightAnchor.constraint(equalTo: right, constant: -paddingRight))
    }
    if width > 0 {
      anchors.append(widthAnchor.constraint(equalToConstant: width))
    }
    if height > 0 {
      anchors.append(heightAnchor.constraint(equalToConstant: height))
    }

    anchors.forEach { $0.isActive = true }

    return anchors
  }

  @discardableResult
  func anchorToSuperview() -> [NSLayoutConstraint] {
    return anchor(top: superview?.topAnchor,
                  left: superview?.leftAnchor,
                  bottom: superview?.bottomAnchor,
                  right: superview?.rightAnchor)
  }
}

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
    }

  func applyShadow(radius: CGFloat,
                   opacity: Float,
                   offset: CGSize,
                   color: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)) {
    layer.shadowRadius = radius
    layer.shadowOpacity = opacity
    layer.shadowOffset = offset
    layer.shadowColor = color.cgColor
  }
    
    
}

extension UIView {
    func installShadow() {
        layer.cornerRadius = 2
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.20
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowRadius = 1.0
    }
}


