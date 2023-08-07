//
//  ContentView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct NakamaView: View {

    @ObservedObject var manager: NakamaManager
    @State private var showImmersiveSpace = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        NavigationSplitView {
            List {
                Text("Item")
            }
            .navigationTitle("Menu")
        } detail: {
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)

                Text("Welcome to Nakama!")
                summonNakamaForm
//                Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
//                    .toggleStyle(.button)
//                    .padding(.top, 50)
            }
            .navigationTitle("Nakama")
            .padding()
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
    }
    
    var summonNakamaForm: some View {
        Form {
            nameSection
            elementSection
            summonButton
        }
    }
    
    var nameSection: some View {
        Section("Your Nakama's name") {
            TextField("Name", text: $manager.YourNakama.name)
        }
    }
    
    var elementSection: some View {
        Section("Element") {
            Picker("Select an element", selection: $manager.YourNakama.element) {
                ForEach(Element.allCases, id: \.self) { element in
                    Text(element.rawValue)
                }
            }
        }
    }
    
    var summonButton: some View {
        Button("Summon Nakama") {
            
        }
    }
    
}

#Preview {
    NakamaView(manager: NakamaManager(name: "", element: Element.fire))
}
