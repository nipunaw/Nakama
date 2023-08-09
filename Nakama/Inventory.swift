//
//  Bag.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/8/23.
//

import Foundation

struct Inventory {
    private var items: [Item]
    private var full: Bool {
        items.count > 10
    }
    
    init(items: [Item]) {
        self.items = items
    }
    
    struct Item {
        private let name: String
        private let statModifiers: Stats

        init(name: String, statModifiers: Stats) {
            self.name = name
            self.statModifiers = statModifiers
        }
    }

}


