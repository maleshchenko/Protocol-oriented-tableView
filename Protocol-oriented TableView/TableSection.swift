//
//  TableSection.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/30/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import UIKit

protocol TableSection {
    typealias CellFactory = ((UITableView, IndexPath) -> UITableViewCell)
    typealias HeaderFactory = (UITableView) -> UIView?
    
    var numberOfRows: Int { get }
    var cellFactory: CellFactory { get }
    var headerHeight: CGFloat { get }
    var headerFactory: HeaderFactory { get }
    
    func separatorInset(for indexPath: IndexPath) -> UIEdgeInsets
    func didSelectRow(for indexPath: IndexPath)
}

extension TableSection {
    var cellFactory: CellFactory { return { _,_ in return UITableViewCell() } }
    var headerHeight: CGFloat { return CGFloat.leastNormalMagnitude }
    var headerFactory: HeaderFactory { return { _ in return nil } }
    
    func separatorInset(for indexPath: IndexPath) -> UIEdgeInsets { return .zero }
    func didSelectRow(for indexPath: IndexPath) {}
}
