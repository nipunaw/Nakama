//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI

class NakamaManager: ObservableObject {

    @Published var YourNakama: Nakama
    @Published var YourInventory: Inventory // Should potentially separate into separate view model

    init(name: String, element: Element) {
        YourNakama = Nakama(name: name, element: element)
        YourInventory = Inventory(items: [])
    }


    // MARK: - Intent(s)

}
