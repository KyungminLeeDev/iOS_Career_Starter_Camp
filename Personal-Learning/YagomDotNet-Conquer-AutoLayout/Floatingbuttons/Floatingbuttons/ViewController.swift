//
//  ViewController.swift
//  Floatingbuttons
//
//  Created by Kyungmin Lee on 2021/09/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let menuButton = MenuButton()
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(menuButton)
        
        menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                             constant: -20).isActive = true
        menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                           constant: -20).isActive = true
    }


}

