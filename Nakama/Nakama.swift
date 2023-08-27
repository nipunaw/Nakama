//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import Foundation

struct Nakama {
    private(set) var name: String
    private(set) var element: Element
    private(set) var friendship: Int
    private(set) var stats: Stats

    init() { // Nakama defaults
        self.name = ""
        self.element = Element.fire
        self.friendship = 0
        self.stats = Stats(attack: Int.random(in: 1...3), defense: Int.random(in: 1...3), agility: Int.random(in: 1...3))
    }
    
    mutating func chooseName(_ name: String) {
        self.name = name
    }
    
    mutating func chooseElement(_ element: Element) {
        self.element = element
    }

    enum Element: String, CaseIterable {
        case fire
        case water
        case earth
    }
}

struct Stats {
    private(set) var attack: Int
    private(set) var defense: Int
    private(set) var agility: Int

    init(attack: Int, defense: Int, agility: Int) {
        self.attack = attack
        self.defense = defense
        self.agility = agility
    }
}
