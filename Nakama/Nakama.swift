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
    fileprivate var attack: Int
    fileprivate var defense: Int
    fileprivate var agility: Int

    init(attack: Int, defense: Int, agility: Int) {
        self.attack = attack
        self.defense = defense
        self.agility = agility
    }
}

struct Item {
    private let name: String
    private let statModifiers: Stats

    init(name: String, statModifiers: Stats) {
        self.name = name
        self.statModifiers = statModifiers
    }
}
