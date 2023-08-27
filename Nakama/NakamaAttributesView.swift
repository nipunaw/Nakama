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
    
    var manager: NakamaManager
    @State private var nakamaName: String = ""
    @State private var nakamaElement: Element = Element.fire
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
                if manager.summoned {
                    nakamaProfile
                } else {
                    summonNakamaForm
                }
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
            TextField("Name", text: $nakamaName)
        }
    }
    
    var elementSection: some View {
        Section("Element") {
            Picker("Select an element", selection: $nakamaElement) {
                ForEach(Element.allCases, id: \.self) { element in
                    Text(element.rawValue)
                }
            }
        }
    }
    
    var summonButton: some View {
        Button("Summon Nakama") {
            manager.chooseName(nakamaName)
            manager.chooseElement(nakamaElement)
            manager.summoned = true
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
            Toggle("See Nakama", isOn: $showImmersiveSpace)
                                .toggleStyle(.button)
                                .padding(.top, 50)
        }
        .font(.largeTitle)
    }
    
}

#Preview {
    NakamaAttributesView(manager: NakamaManager())
}
