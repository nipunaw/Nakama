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
    
    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: nakamaColor, isMetallic: false)]
            )
            content.add(model)
        }
    }
}
