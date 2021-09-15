//
//  CustomTableViewCell.swift
//  SelfSizing
//
//  Created by Kyungmin Lee on 2021/09/15.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var myImageView: UIImageView!
    var titleLabel: UILabel!
    var postLabel: UILabel!
    
    private var postHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImageView = UIImageView()
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(myImageView)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .black
        
        postLabel = UILabel()
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.font = UIFont.preferredFont(forTextStyle: .body)
        postLabel.adjustsFontForContentSizeCategory = true
        postLabel.textColor = .darkGray
        postLabel.numberOfLines = 0
        
        postHeight = postLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 50)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, postLabel])
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            myImageView.widthAnchor.constraint(equalTo: myImageView.heightAnchor),
            myImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: myImageView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postHeight
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(togglePost))
        postLabel.addGestureRecognizer(tapGesture)
        postLabel.isUserInteractionEnabled = true
    }
    
    @objc func togglePost() {
        guard let height = postHeight else {
            return
        }
        
        height.isActive = !height.isActive
        
        NotificationCenter.default.post(name: Notification.Name("layoutCell"),
                                        object: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
