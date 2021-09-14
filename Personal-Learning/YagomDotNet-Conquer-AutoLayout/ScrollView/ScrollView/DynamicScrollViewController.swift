//
//  DynamicScrollViewController.swift
//  ScrollView
//
//  Created by Kyungmin Lee on 2021/09/14.
//

import UIKit

class DynamicScrollViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addView() {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.isHidden = true
        label.text = """
            asfasfsafsfaf
            asdfvw3323
            a2324424
            asdsadfsa
            sadfasdfsf
            asdfsf
            """
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        stackView.addArrangedSubview(label)
        
        UIView.animate(withDuration: 0.3) {
            label.isHidden = false
        }
    }
    
    @IBAction func removeView() {
        guard let last = stackView.arrangedSubviews.last else {
            return
        }
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { (_) in
            self.stackView.removeArrangedSubview(last)
        }
    }

}
