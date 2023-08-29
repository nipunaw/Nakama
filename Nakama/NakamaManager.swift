//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import SwiftUI
import Observation

@Observable class NakamaManager {

    var YourNakama: Nakama
    var summoned: Bool
    var inspecting: Bool
    var playing: Bool

    init() {
        YourNakama = Nakama()
        summoned = false
        inspecting = false
        playing = false
    }

    // MARK: - Intent(s)
    
    func chooseName(_ pickedName: String) {
        YourNakama.chooseName(pickedName)
    }
    
    func chooseElement(_ pickedElement: Element) {
        YourNakama.chooseElement(pickedElement)
    }
    
    func color() -> UIColor {
        if YourNakama.element == Element.fire { return .red }
        else if YourNakama.element == Element.earth { return .green }
        else { return .blue }
    }
    
    func kiIcon() -> String {
        if YourNakama.element == Element.fire { return "flame" }
        else if YourNakama.element == Element.earth { return "leaf" }
        else { return "drop" }
    }
    
    func name() -> String {
        YourNakama.name
    }
    
    func element() -> Element {
        YourNakama.element
    }
    
    func friendship() -> Int {
        YourNakama.friendship
    }
    
    func attack() -> Int {
        YourNakama.stats.attack
    }
    
    func defense() -> Int {
        YourNakama.stats.defense
    }
    
    func agility() -> Int {
        YourNakama.stats.agility
    }
}
