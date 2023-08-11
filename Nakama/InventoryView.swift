//
//  InventoryView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/10/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct InventoryView: View {
    
    @ObservedObject var manager: InventoryManager
    
    var body: some View {
        VStack {
            Text("Inventory Items")
            ForEach(manager.YourInventory.items) { item in
                Text(item.name)
            }
        }
    }
}
