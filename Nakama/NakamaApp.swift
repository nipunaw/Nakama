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
        WindowGroup {
            let manager = NakamaManager(name: "", element: Element.fire)
            NakamaAttributesView(manager: manager)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
