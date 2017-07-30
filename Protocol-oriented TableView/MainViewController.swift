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
        let vc = ViewController(model: ItemDetailModel(name: "", description: ""))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
