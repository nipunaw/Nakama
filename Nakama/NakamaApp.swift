//
//  NakamaApp.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI

@main
struct NakamaApp: App {
    var body: some Scene {
        let manager = NakamaManager()
        
        WindowGroup {
            NakamaAttributesView(manager: manager)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(manager: manager)
        }
    }
}
