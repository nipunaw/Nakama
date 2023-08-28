//
//  ContentView.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import RealityKit
import NakamaAssets

struct NakamaAttributesView: View {
    
    var manager: NakamaManager
    @State private var nakamaName: String = ""
    @State private var nakamaElement: Element = Element.fire
    @State private var showImmersiveSpace = false
    @Environment(\.openWindow) var openWindow
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
        HStack {
            VStack(alignment: .leading) {
                Text("Your Nakama \(manager.name())")
                HStack{
                    Image(systemName: "heart")
                    Text("Friendship Level: \(manager.friendship())")
                }
                HStack {
                    if manager.element() == .fire { Image(systemName: "flame") }
                    else if manager.element() == .water { Image(systemName: "drop") }
                    else { Image(systemName: "leaf") }
                    Text("Ki: \(manager.attack())")
                }
                HStack {
                    Image(systemName: "shield")
                    Text("Defense: \(manager.defense())")
                }
                HStack {
                    Image(systemName: "hare")
                    Text("Agility: \(manager.agility())")
                }
                Button("View Nakama") {
                    openWindow(id: "Nakama")
                }
//                Button("Play with Nakama") {
//                    Task {
//                        await openImmersiveSpace(id: "ImmersiveSpace")
//                    }
//                }
            }
            .font(.largeTitle)
            .padding(30)
            Image("Cat")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
        }
    }
    
}

#Preview {
    NakamaAttributesView(manager: NakamaManager())
}
