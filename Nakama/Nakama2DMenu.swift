//
//  Nakama2DMenu.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import RealityKit
import NakamaAssets

struct Nakama2DMenu: View {
    
    @Environment(NakamaManager.self) private var manager
    //Form
    @State private var formName = ""
    @State private var formElement = Element.fire
    //Alerts
    @State private var showNoNameAlert = false
    @State private var showLargeNameAlert = false
    
    var body: some View {
        Group {
            if manager.summoned {
                nakamaProfile
            } else {
                welcomePrompt
            }
        }
        .padding(100)
        .font(.largeTitle)
    }
    
    var welcomePrompt: some View {
        NavigationStack {
            HStack {
                Text("Nakama").font(.extraLargeTitle)
                Image(systemName: "cat.fill")
            }
            Spacer()
            Text("Welcome! In this world, you can interact with and nurture your own virtual companion. Since you're new, please go ahead and create your Nakama using the below button.")
            Spacer()
            NavigationLink {
                summonNakamaForm
            } label: {
                Text("Create Nakama")
            }
        }
    }
    
    var summonNakamaForm: some View {
        VStack {
            Text("Create Nakama").font(.extraLargeTitle).padding(-10)
            Form {
                nameSection
                elementSection
                summonButton
            }
        }
        .alert("Please provide a name", isPresented: $showNoNameAlert) {}
        .alert("Please provide shorter name (< 10 char)", isPresented: $showLargeNameAlert) {}
    }
    
    var nameSection: some View {
        Section("Your Nakama's name") {
            TextField("Name", text: $formName)
        }
    }
    
    var elementSection: some View {
        Section("Element") {
            Picker("Select an element", selection: $formElement) {
                ForEach(Element.allCases, id: \.self) { element in
                    Text(element.rawValue.capitalized)
                }
            }
        }
    }
    
    var summonButton: some View {
        Button("Summon Nakama") {
            if formName.isEmpty {
                showNoNameAlert = true
            } else if formName.count > 10 {
                showLargeNameAlert = true
            } else {
                manager.chooseName(formName)
                manager.chooseElement(formElement)
                manager.summoned = true
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var nakamaProfile: some View {
        VStack {
            Text("Your Nakama's Stats").font(.extraLargeTitle)
            HStack {
                profileStats
                profileImage
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomOrnament) {
                profileToolItems
            }
        }
    }
    
    var profileStats: some View {
        let stats =
        [Statistic(id: 0, icon: "person.text.rectangle", attribute: "Name", value: manager.name()),
         Statistic(id: 1, icon: "heart", attribute: "Friendship", value: String(manager.friendship())),
         Statistic(id: 2, icon: manager.kiIcon(), attribute: "Ki", value: String(manager.attack())),
         Statistic(id: 3, icon: "shield", attribute: "Defense", value: String(manager.defense())),
         Statistic(id: 4, icon: "hare", attribute: "Agility", value: String(manager.agility()))]
        
        return Grid {
            ForEach(stats) { stat in
                GridRow {
                    Image(systemName: stat.icon)
                    Text(stat.attribute)
                        .gridColumnAlignment(.leading)
                    Text(stat.value)
                }
                if stat.id != stats.count-1 {
                    Divider()
                }
            }
        }
        .padding()
        .background(.regularMaterial,
                    in: .rect(cornerRadius: 12))
        
    }
    
    var profileImage: some View {
        Image("Cat")
            .resizable()
            .scaledToFit()
            .frame(width: 300)
            .padding()
    }
    
    var profileToolItems: some View {
        @Bindable var manager = manager
        return Group {
            WindowToggle(icon: "magnifyingglass.circle", id: "Nakama", isShowing: $manager.inspecting)
            VStack {
                Text("View or Play")
                Text("Interact with your Nakama")
                    .foregroundStyle(.secondary)
                    .font(.headline)
            }
            SpaceToggle(icon: "visionpro.circle", id: "ImmersiveSpace", isShowing: $manager.playing)
            
        }
    }
    
}

private struct Statistic: Identifiable {
    private(set) var id: Int
    private(set) var icon: String
    private(set) var attribute: String
    private(set) var value: String
    
    init(id: Int, icon: String, attribute: String, value: String) {
        self.id = id
        self.icon = icon
        self.attribute = attribute
        self.value = value
    }
}

private struct WindowToggle: View {
    var icon: String
    var id: String
    @Binding var isShowing: Bool
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some View {
        Toggle(isOn: $isShowing) {
            Image(systemName: icon)
        }
        .onChange(of: isShowing) {_, isShowing in
            if isShowing {
                openWindow(id: id)
            } else {
                dismissWindow(id: id)
            }
        }
        .toggleStyle(.button)
    }
}

private struct SpaceToggle: View {
    var icon: String
    var id: String
    @Binding var isShowing: Bool
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        Toggle(isOn: $isShowing) {
            Image(systemName: icon)
        }
        .onChange(of: isShowing) {_, isShowing in
            Task {
                if isShowing {
                    await openImmersiveSpace(id: id)
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
        .toggleStyle(.button)
    }
}

#Preview {
    Nakama2DMenu()
}
