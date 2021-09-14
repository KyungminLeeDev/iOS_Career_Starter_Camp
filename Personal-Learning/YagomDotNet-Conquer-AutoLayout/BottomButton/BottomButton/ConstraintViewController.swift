//
//  ConstraintViewController.swift
//  BottomButton
//
//  Created by Kyungmin Lee on 2021/09/14.
//

import UIKit

class ConstraintViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        let leading = NSLayoutConstraint(item: button,
                                         attribute: .leading,
                                         relatedBy: .equal,
                                         toItem: safeArea,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 16)
        let trailing = NSLayoutConstraint(item: button,
                                          attribute: .trailing,
                                          relatedBy: .equal,
                                          toItem: safeArea,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: -16)
        let bottomSafeArea = NSLayoutConstraint(item: button,
                                                attribute: .bottom,
                                                relatedBy: .equal,
                                                toItem: safeArea,
                                                attribute: .bottom,
                                                multiplier: 1,
                                                constant: -16)
        bottomSafeArea.priority = .defaultHigh
        let bottomView = NSLayoutConstraint(item: button,
                                                attribute: .bottom,
                                                relatedBy: .lessThanOrEqual,
                                                toItem: view,
                                                attribute: .bottom,
                                                multiplier: 1,
                                                constant: -20)
        NSLayoutConstraint.activate([leading, trailing, bottomView, bottomSafeArea])
        
    }
    


}
