//
//  TitleSection.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/31/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import UIKit

struct TitleSection: TableSection {
    let items: [ItemDetailModel]
    var numberOfRows: Int { return items.count }
    
    var cellFactory: TableSection.CellFactory {
        let items = self.items
        return { tableView, indexPath in
            let cell: TitleCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(field: items[indexPath.row])
            return cell
        }
    }
}

class TitleCell: UITableViewCell, ReusableCell {    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(field: ItemDetailModel) {
        textLabel?.text = field.name
    }
}
