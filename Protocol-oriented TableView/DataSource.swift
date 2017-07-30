//
//  DataSource.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/30/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import UIKit

class DataSource: NSObject, UITableViewDataSource {
    let sections: [TableSection]
    let defaultHeight: CGFloat = 16.0
    
    init(sections: [TableSection]) {
        self.sections = sections
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        return section.cellFactory(tableView, indexPath)
    }
}

extension DataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        cell.separatorInset = section.separatorInset(for: indexPath)
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = sections[section]
        return section.headerFactory(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let section = sections[section]
        return section.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return defaultHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.sectionFooterHeight))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = sections[indexPath.section]
        section.didSelectRow(for: indexPath)
    }
}
