//
//  ImmersiveView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View { // Will need this immersive view to have companion placed correctly (environment-aware)
    @ObservedObject var manager: NakamaManager
    
    var body: some View {
        NakamaView(nakamaColor: manager.color())
    }
}

#Preview {
    ImmersiveView(manager: NakamaManager(name: "", element: Element.fire))
        .previewLayout(.sizeThatFits)
}
