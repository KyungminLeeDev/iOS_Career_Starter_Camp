//
//  StackViewController.swift
//  BottomButton
//
//  Created by Kyungmin Lee on 2021/09/14.
//

import UIKit

class StackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vertical = UIStackView()
        vertical.axis = .vertical
        vertical.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(vertical)
        
        let horizontal = UIStackView()
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontal)
        
        let addbutton = UIButton()
        addbutton.setTitle("Add", for: .normal)
        addbutton.setTitleColor(.blue, for: .normal)
        
        let removeButton = UIButton()
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(.blue, for: .normal)
        
        horizontal.addArrangedSubview(addbutton)
        horizontal.addArrangedSubview(removeButton)
        horizontal.distribution = .fillEqually
        
        horizontal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        horizontal.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        horizontal.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        vertical.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        vertical.bottomAnchor.constraint(equalTo: horizontal.topAnchor).isActive = true
        vertical.leadingAnchor.constraint(equalTo: horizontal.leadingAnchor).isActive = true
        vertical.trailingAnchor.constraint(equalTo: horizontal.trailingAnchor).isActive = true
    }
    

}
