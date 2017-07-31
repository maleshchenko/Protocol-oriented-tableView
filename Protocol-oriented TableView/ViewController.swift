//
//  ViewController.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/30/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let model: ItemDetailModel
    private let sections: [TableSection]
    private let dataSource: DataSource

    public init(model: ItemDetailModel) {
        self.model = model
        let sections: [TableSection] = [TitleSection(items: [model])]
        self.sections = sections
        dataSource = DataSource(sections: sections)
        super.init(nibName: nil, bundle: nil)
        tableView.frame = view.frame
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.estimatedRowHeight = 48.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.frame = view.frame
        view.addSubview(tableView)
    }
    
    private func setupStyles() {
        title = "Item Status"
        self.navigationController?.navigationBar.isHidden = false
        tableView.allowsSelection = false
    }
}

