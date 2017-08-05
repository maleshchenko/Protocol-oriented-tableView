//
//  TitleSection.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/31/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import UIKit

struct ItemsSection: TableSection {
    let items: [ItemModel]
    var numberOfRows: Int { return items.count }
    
    var cellFactory: TableSection.CellFactory {
        let items = self.items
        return { tableView, indexPath in
            let cell: ItemCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(model: items[indexPath.row])
            return cell
        }
    }
    
    let headerHeight: CGFloat = 40
    var headerFactory: TableSection.HeaderFactory {
        return { tableView in
            return ItemsSectionHeaderView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width,
                                                    height: self.headerHeight))
        }
    }
    
    static let headerText = "Items List"
}

class ItemsSectionHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let headerView = UIView(frame: frame)
        
        let label = UILabel(frame: headerView.frame)
        label.frame.origin.x = 20
        label.textColor = UIColor.lightGray
        label.text = ItemsSection.headerText
        
        headerView.addSubview(label)
        self.addSubview(headerView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("This is an IB-less class. Don't instantiate through IB.")
    }
}
