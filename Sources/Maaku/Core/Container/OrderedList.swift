//
//  OrderedList.swift
//  Maaku
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

import Foundation

/// Represents a markdown ordered list.
public struct OrderedList: List {

    /// The list items.
    public let items: [Block]
    
    ///
    public let listStartingNumber: Int32
    
    public let listTight: Bool

    /// Creates an OrderedList.
    ///
    /// - Returns:
    ///     The initialized OrderedList.
    public init(listStartingNumber: Int32 = 1, listTight: Bool = false) {
        items = []
        self.listStartingNumber = listStartingNumber
        self.listTight = listTight
    }

    /// Creates an OrderedList with the specified items.
    ///
    /// - Parameters:
    ///     - items: The block items.
    /// - Returns:
    ///     The initialized OrderedList.
    public init(items: [Block], listStartingNumber: Int32 = 1, listTight: Bool = false) {
        self.items = items
        self.listStartingNumber = listStartingNumber
        self.listTight = listTight
    }

}

public extension OrderedList {

    func attributedText(style: Style) -> NSAttributedString {
        let attributed = NSMutableAttributedString()

        for (index, item) in items.enumerated() {
            let listNumber = NSAttributedString(
                string: "\(index + 1). ",
                attributes: [.font: style.fonts.current, .foregroundColor: style.colors.current]
            )
            attributed.append(listNumber)
            attributed.append(item.attributedText(style: style))
        }

        return attributed
    }

}
