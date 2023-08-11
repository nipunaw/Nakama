//
//  InventoryManager.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/10/23.
//

import Foundation

class InventoryManager: ObservableObject {

    @Published var YourInventory: Inventory // Should potentially separate into separate view model

    init(name: String, element: Element) {
        YourInventory = Inventory(items: [])
    }


    // MARK: - Intent(s)
    
    
    
}
