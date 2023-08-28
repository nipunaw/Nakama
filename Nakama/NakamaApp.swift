//
//  NakamaApp.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import NakamaAssets

@main
struct NakamaApp: App {
    
    var body: some Scene {
        let manager = NakamaManager()
        
        WindowGroup { // Window
            NakamaAttributesView(manager: manager)
        }
        
        WindowGroup(id: "Nakama") { // Volume
            NakamaView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)


        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(nakamaColor: .red)
        }
    }
}
