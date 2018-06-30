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
    private var dataSource: DataSource!

    public init(items: [ItemModel]) {
        super.init(nibName: nil, bundle: nil)

        let sections: [TableSection] = [ItemsSection(items: items, didSelectItem: { [unowned self] (item) in
            self.handleSelection(item: item)
        })]
        
        self.dataSource = DataSource(sections: sections)
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
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.frame = view.frame
        view.addSubview(tableView)
    }
    
    private func setupStyles() {
        title = "Items"
    }
    
    private func handleSelection(item: ItemModel) -> () {
        print("\n\nselected \(item.name)\n\n")
    }
}

