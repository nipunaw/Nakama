//
//  NakamaView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/10/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct NakamaView: View {
    
    var nakamaColor: SimpleMaterial.Color
    @State private var pet = false
    
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: nakamaColor, isMetallic: false)]
            )
            content.add(model)
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.1)]))
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
