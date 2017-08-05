//
//  MainViewController.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/30/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func showDetailController() {
        let itemsToDisplay = [ItemModel(name: "item1", date: "27-06-17"),
                              ItemModel(name: "item2", date: "28-06-17", description: "item2 description"),
                              ItemModel(name: "item3", date: "29-07-17")]
        
        let vc = ViewController(items: itemsToDisplay)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
