//
//  ContentView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct NakamaAttributesView: View {
    
    @ObservedObject var manager: NakamaManager
    @State private var showImmersiveSpace = false
    @State private var showProfile = false
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
                if showProfile {
                    nakamaProfile
                } else {
                    summonNakamaForm
                }
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
            showProfile = true
        }
    }
    
    var nakamaProfile: some View {
        VStack {
            Text("Your Nakama \(manager.YourNakama.name)")
            HStack{
                Image(systemName: "heart")
                Text("Friendship Level: \(manager.YourNakama.friendship)")
            }
            HStack {
                if manager.YourNakama.element == Element.fire { Image(systemName: "flame") }
                else if manager.YourNakama.element == Element.water { Image(systemName: "drop") }
                else { Image(systemName: "leaf") }
                Text("Ki: \(manager.YourNakama.stats.attack)")
            }
            HStack {
                Image(systemName: "shield")
                Text("Defense: \(manager.YourNakama.stats.defense)")
            }
            HStack {
                Image(systemName: "hare")
                Text("Agility: \(manager.YourNakama.stats.agility)")
            }
            if manager.YourNakama.element == Element.fire {
                NakamaView(nakamaColor: .red)
            } else if manager.YourNakama.element == Element.water {
                NakamaView(nakamaColor: .blue)
            } else {
                NakamaView(nakamaColor: .green)
            }
        }
        .font(.largeTitle)
    }
    
}

#Preview {
    NakamaAttributesView(manager: NakamaManager(name: "", element: Element.fire))
}
