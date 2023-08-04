//
//  Nakama.swift
//  Nakama
//
//  Created by Nipuna Weerapperuma on 8/3/23.
//

import Foundation

struct Nakama {
    private(set) let name: String
    private(set) let type: Type
    private(set) var friendship: Int
    private(set) var stats: Stats

    init(name: String, type: Type) {
        self.name = name
        self.type = type
        self.friendship = 0
        self.stats = Stats(Int.random(in: 1...3), Int.random(in: 1...3), Int.random(in: 1...3))
    }

    enum Type {
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

    init(name: String) {
        self.name = name
    }
}