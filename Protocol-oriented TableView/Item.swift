//
//  ItemDetailModel.swift
//  Protocol-oriented TableView
//
//  Created by Mykola Aleshchenko on 7/30/17.
//  Copyright © 2017 Mykola Aleshchenko. All rights reserved.
//

import Foundation
import UIKit

public struct ItemModel {
    let name: String
    let date: String
    let description: String?
    
    public init(name: String, date: String, description: String? = nil) {
        self.name = name
        self.date = date
        self.description = description
    }
}

class ItemCell: UITableViewCell, ReusableCell {
    let defaultSpacing: CGFloat = 5.0
    
    let nameLabel = UILabel()
    let dateLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let horizontallyAlignedElements = [self.nameLabel, self.dateLabel]
        let horizontalStack = UIStackView(arrangedSubviews: horizontallyAlignedElements)
        horizontalStack.alignment = .leading
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = defaultSpacing

        let verticallyAlignedElements: [UIView] = [horizontalStack, descriptionLabel]
        let verticalStack = UIStackView(arrangedSubviews: verticallyAlignedElements)
        verticalStack.isLayoutMarginsRelativeArrangement = true
        verticalStack.preservesSuperviewLayoutMargins = true
        verticalStack.axis = .vertical
        verticalStack.alignment = .leading
        verticalStack.spacing = defaultSpacing
        
        self.contentView.addSubview(verticalStack)
        verticalStack.addConstaintsToSuperview(topOffset: defaultSpacing, bottomOffset: defaultSpacing)
        verticalStack.backgroundColor = UIColor.red
        
        setUpStyles()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This is an IB-less class. Don't instantiate through IB.")
    }
    
    private func setUpStyles() {
        nameLabel.textColor = UIColor.black
        dateLabel.textColor = UIColor.lightGray
        descriptionLabel.textColor = UIColor.lightGray
    }
    
    func configure(model: ItemModel) {
        nameLabel.text = model.name
        dateLabel.text = model.date
        descriptionLabel.text = model.description ?? "No description"
    }
}


extension UIView {
    func addConstaintsToSuperview(topOffset: CGFloat, bottomOffset: CGFloat) {
        //setting top/bottom constraints to get UITableViewAutomaticDimension to work

        guard superview != nil else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: superview!.topAnchor, constant: topOffset).isActive = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor, constant: bottomOffset).isActive = true
    }
}
