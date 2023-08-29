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
    @State private var manager = NakamaManager()
    
    var body: some Scene {
        WindowGroup { // Window
            Nakama2DMenu()
                .environment(manager)
        }
        .defaultSize(width: 900, height: 750)
        
        WindowGroup(id: "Nakama") { // Volume
            Nakama3DBasicView()
                .environment(manager)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.5, height: 0.5, depth: 0.5, in: .meters)


        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(nakamaColor: .red)
        }
    }
}
