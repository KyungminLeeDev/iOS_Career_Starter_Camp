//
//  ViewController.swift
//  LoginViewChallange
//
//  Created by Kyungmin Lee on 2021/09/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(adjustButtonDynamicTypes),
//                                               name: UIContentSizeCategory.didChangeNotification,
//                                               object: nil)
        buttons.forEach { (button) in
            button.titleLabel?.adjustsFontForContentSizeCategory = true
        }
    }

//    @objc func adjustButtonDynamicTypes() {
//        buttons.forEach { (button) in
//            button.titleLabel?.adjustsFontForContentSizeCategory = true
//        }
//    }

}

