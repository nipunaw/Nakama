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
    
    var body: some View {
        Model3D(named: "Nakama", bundle: nakamaAssetsBundle) { model in
            model.resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            ProgressView()
        }
    }
}
