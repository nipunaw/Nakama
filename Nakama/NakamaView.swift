//
//  NakamaView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/10/23.
//

import SwiftUI
import RealityKit
import NakamaAssets

struct NakamaView: View {
    
    var nakamaColor: SimpleMaterial.Color
    @State private var pet = false
    
    var body: some View {
        RealityView { content in
            guard let nakama = try? await Entity(named: "Scene", in: nakamaAssetsBundle) else {
                fatalError("Unable to load Nakama model.")
            }
            content.add(nakama)
            nakama.components.set(InputTargetComponent())
            nakama.generateCollisionShapes(recursive: true)
            nakama.components[PhysicsBodyComponent.self] = PhysicsBodyComponent()
        } update: { content in
            if let model = content.entities.first {
                model.transform.scale = pet ? [2.0, 2.0, 2.0] : [1.0, 1.0, 1.0]
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
            pet.toggle()
        })
    }
}
