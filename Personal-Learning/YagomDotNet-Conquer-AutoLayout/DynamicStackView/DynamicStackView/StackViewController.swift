//
//  StackViewController.swift
//  BottomButton
//
//  Created by Kyungmin Lee on 2021/09/14.
//

import UIKit

class StackViewController: UIViewController {
    
    var vertical: UIStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        vertical.axis = .vertical
        vertical.translatesAutoresizingMaskIntoConstraints = false
        vertical.spacing = 10
        vertical.distribution = .fillEqually
        view.addSubview(vertical)
        
        let horizontal = UIStackView()
        horizontal.axis = .horizontal
        horizontal.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontal)
        
        let addbutton = UIButton()
        addbutton.setTitle("Add", for: .normal)
        addbutton.setTitleColor(.blue, for: .normal)
        addbutton.addTarget(self, action: #selector(addView), for: .touchUpInside)
        
        let removeButton = UIButton()
        removeButton.setTitle("Remove", for: .normal)
        removeButton.setTitleColor(.blue, for: .normal)
        removeButton.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        
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
    

    @objc func addView() {
        let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        vertical.addArrangedSubview(view)
        
        UIView.animate(withDuration: 0.3) {
            view.isHidden = false
        }
    }
    
    @objc func removeView() {
        guard let last = vertical.arrangedSubviews.last else {
            return
        }
        UIView.animate(withDuration: 0.3) {
            last.isHidden = true
        } completion: { (_) in
            self.vertical.removeArrangedSubview(last)
        }
        
        
    }
}
