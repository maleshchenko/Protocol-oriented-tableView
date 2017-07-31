//
//  ReusableCell.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/31/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import UIKit

/// ReusableCell is a protocol to dequeue type safe cells.
public protocol ReusableCell {
    /// a reuse identifier to dequeue the cell is required.
    static var identifier: String { get }
}

public extension ReusableCell {
    /// by default the identifier is the type itself as String.
    static var identifier: String {
        return String(describing: self)
    }
}

// MARK: - ReusableCell tableview extension.
public extension UITableView {
    /// A generic function that registers and dequeues a table view cell with a specific type
    ///
    /// - Parameter indexPath: the index path where we want the cell
    /// - Returns: a resuable cell with type specified by the input
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableCell {
        self.register(T.self, forCellReuseIdentifier: T.identifier)
        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            assertionFailure("Failed to dequeue cell \(T.identifier)")
            return T()
        }
        return cell
    }
}
