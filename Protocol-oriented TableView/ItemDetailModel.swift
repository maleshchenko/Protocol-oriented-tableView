//
//  ItemDetailModel.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/30/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import Foundation

public struct ItemDetailModel {
    let name: String
    let description: String
    
    public init(name: String, description: String) {
        self.name = name
        self.description = name
    }
}
