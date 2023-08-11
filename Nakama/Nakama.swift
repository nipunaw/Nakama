//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import Foundation

struct Nakama {
    var name: String
    var element: Element
    private(set) var friendship: Int
    private(set) var stats: Stats

    init(name: String, element: Element) {
        self.name = name
        self.element = element
        self.friendship = 0
        self.stats = Stats(attack: Int.random(in: 1...3), defense: Int.random(in: 1...3), agility: Int.random(in: 1...3))
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
