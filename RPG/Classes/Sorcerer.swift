//
//  Sorcerer.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Sorcerer: Hero {
    init() {
        super.init(name: "Sorcerer", initialHealthPoints: 25, healthPoints: 25, initialManaPoints: 20, manaPoints: 20, attackList: ["Chaos Bolt", "Mana Surge", "Spell Shield"])
    }
}
