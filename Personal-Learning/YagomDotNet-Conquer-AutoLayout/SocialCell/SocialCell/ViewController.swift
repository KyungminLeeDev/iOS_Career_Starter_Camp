//
//  SocialCell - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        addTable()
        configureTable()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("NeedsUpdateLayout"),
                                               object: nil,
                                               queue: nil) { [self] (notification) in
            tableView.beginUpdates()
            tableView.endUpdates()
        }
                                            
    }
    
    private func addTable() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = true
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func configureTable() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(FeedTableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        
        let searchBar: UISearchBar = UISearchBar()
        searchBar.placeholder = "검색"
        searchBar.searchTextField.backgroundColor = .white
        
        navigationItem.titleView = searchBar
        
        let cameraButton = UIBarButtonItem(systemItem: .camera)
        let shareButton = UIBarButtonItem(systemItem: .action)
        
        navigationItem.leftBarButtonItem = cameraButton
        navigationItem.rightBarButtonItem = shareButton
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FeedTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        }
        cell.feed = Feed.feeds[Int.random(in: 0...9)]
        return cell
    }
}
