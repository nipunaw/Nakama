//
//  Bag.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/8/23.
//

import Foundation

struct Inventory {
    private(set) var items: [Item]
    var full: Bool {
        items.count > 10
    }
    
    init(items: [Item]) {
        self.items = items
    }
    
    struct Item: Identifiable {
        let name: String
        let statModifiers: Stats
        let slot: Slot
        let id: Int

        init(name: String, statModifiers: Stats, slot: Slot, id: Int) {
            self.name = name
            self.statModifiers = statModifiers
            self.slot = slot
            self.id = id
        }
        
        enum Slot {
            case weapon
            case armor
            case accessory
        }
    }

}


