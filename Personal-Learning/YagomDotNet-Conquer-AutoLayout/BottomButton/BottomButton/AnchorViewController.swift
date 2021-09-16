//
//  AnchorViewController.swift
//  BottomButton
//
//  Created by Kyungmin Lee on 2021/09/14.
//

import UIKit

class AnchorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide // safe area를 나타내는 가이드
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                        constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                        constant: -16).isActive = true
        let safeBottomAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        safeBottomAnchor.priority = .defaultHigh
        safeBottomAnchor.isActive = true
        
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor,
                                                              constant: -20)
        viewBottomAnchor.isActive = true
    }
    

}
