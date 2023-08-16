//
//  InventoryManager.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/10/23.
//

import Foundation

class InventoryManager: ObservableObject {

    @Published var YourInventory: Inventory // Should potentially separate into separate view model
    typealias Slot = Inventory.Item.Slot
    
    init() {
        YourInventory = Inventory(items: [])
    }


    // MARK: - Intent(s)
    
    func addItem(name: String, statModifiers: Stats, slot: Slot) {
        YourInventory.addItem(name: name, statModifiers: statModifiers, slot: slot)
    }
    
}
