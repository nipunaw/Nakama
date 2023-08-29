//
//  Nakama3DBasicView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/10/23.
//

import SwiftUI
import RealityKit
import NakamaAssets

struct Nakama3DBasicView: View {
    
    @Environment(NakamaManager.self) private var manager
    
    var body: some View {
        Model3D(named: "Nakama", bundle: nakamaAssetsBundle) { model in
            withAnimation {
                model.resizable()
                    .aspectRatio(contentMode: .fit)
                    .rotation3DEffect(.degrees(30), axis: (x: 0, y: 1, z: 0))
            }
        } placeholder: {
            ProgressView()
        }
        .onDisappear {
            manager.inspecting = false
        }
    }
}
