//
//  ImmersiveView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import RealityKit
import NakamaAssets

struct ImmersiveView: View { // Will need this immersive view to have companion placed correctly (environment-aware)
    //var manager: NakamaManager
    var nakamaColor: SimpleMaterial.Color
    @State private var pet = false
    @State private var moveAmount = 0
    @Environment(NakamaManager.self) private var manager
    
    var body: some View {
        RealityView { content in
            if let nakama = try? await Entity(named: "Scene", in: nakamaAssetsBundle) {
                let floor = AnchorEntity(.plane(.horizontal, classification: .floor, minimumBounds: [0.5, 0.5]))
                floor.addChild(nakama)
                content.add(floor)
                nakama.components.set(InputTargetComponent())
                nakama.generateCollisionShapes(recursive: true)
                nakama.components[PhysicsBodyComponent.self] = PhysicsBodyComponent()
            }
            
        } update: { content in
            let move = FromToByAnimation(to: Transform(translation: [Float(self.moveAmount),0,0]),
                                         duration: 5,
                                         bindTarget: .transform)
            
            if let nakama = content.entities.first, let walking = nakama.availableAnimations.first, let moveAnimation = try? AnimationResource.generate(with: move) {
                nakama.playAnimation(moveAnimation)
                nakama.playAnimation(walking)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
                let movementOptions = [0, 1, 2]
                self.moveAmount = movementOptions.randomElement()!
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
            pet.toggle()
        })
    }
}

#Preview {
    ImmersiveView(nakamaColor: .red)
        .previewLayout(.sizeThatFits)
}
