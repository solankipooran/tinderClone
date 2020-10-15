//
//  TinderCardFooterView.swift
//  tinderClone
//
//  Created by POORAN SUTHAR on 06/08/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit
import Shuffle

class TinderCardFooterView: UIView {
    
    private var label = UILabel()
    
    private var gradientLayer: CAGradientLayer?
    var iButtonTarget: (() -> Void)?
    
    init(withTitle title: String?, subtitle: String?) {
        super.init(frame: CGRect.zero)
        backgroundColor = .clear
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.cornerRadius = 10
        clipsToBounds = true
        isOpaque = false
        initialize(title: title, subtitle: subtitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    private func initialize(title: String?, subtitle: String?) {
        let attributedText = NSMutableAttributedString(string: (title ?? "") + "\n",
                                                       attributes: NSAttributedString.Key.titleAttributes)
        if let subtitle = subtitle, !subtitle.isEmpty {
            attributedText.append(NSMutableAttributedString(string: subtitle,
                                                            attributes: NSAttributedString.Key.subtitleAttributes))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            paragraphStyle.lineBreakMode = .byTruncatingTail
            attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle],
                                         range: NSRange(location: 0, length: attributedText.length))
            label.numberOfLines = 2
        }
        
        label.attributedText = attributedText
        let uiScreen = UIScreen.main.bounds
        let button = UIButton(frame: CGRect(x: uiScreen.width - 100 , y: 20, width: 35, height: 35))
        button.addTarget(self, action: #selector(iButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "info"), for: .normal)
        addSubview(button)
        addSubview(label)
    }
    
    @objc func iButtonTapped() {
        iButtonTarget?()
    }
    
    override func layoutSubviews() {
        let padding: CGFloat = 20
        label.frame = CGRect(x: padding,
                             y: bounds.height - label.intrinsicContentSize.height - padding,
                             width: bounds.width - 2 * padding,
                             height: label.intrinsicContentSize.height)
    }
}

extension NSAttributedString.Key {

  static var shadowAttribute: NSShadow = {
    let shadow = NSShadow()
    shadow.shadowOffset = CGSize(width: 0, height: 1)
    shadow.shadowBlurRadius = 2
    shadow.shadowColor = UIColor.black.withAlphaComponent(0.3)
    return shadow
  }()

  static var titleAttributes: [NSAttributedString.Key: Any] = [
    // swiftlint:disable:next force_unwrapping
    NSAttributedString.Key.font: UIFont(name: "ArialRoundedMTBold", size: 24)!,
    NSAttributedString.Key.foregroundColor: UIColor.white,
    NSAttributedString.Key.shadow: NSAttributedString.Key.shadowAttribute
  ]

  static var subtitleAttributes: [NSAttributedString.Key: Any] = [
    // swiftlint:disable:next force_unwrapping
    NSAttributedString.Key.font: UIFont(name: "Arial", size: 17)!,
    NSAttributedString.Key.foregroundColor: UIColor.white,
    NSAttributedString.Key.shadow: NSAttributedString.Key.shadowAttribute
  ]
}
