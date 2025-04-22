//
//  Sorcerer.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Sorcerer: Hero {
    let spark: Attack = Attack(name: "Spark", powerMultiplier: 0.8, manaCost: 0)
    let chaosBolt: Attack = Attack(name: "Chaos Bolt", powerMultiplier: 1.2, manaCost: 4)
    init() {
        super.init(name: "Sorcerer", maxHealthPoints: 25, healthPoints: 25, maxManaPoints: 20, manaPoints: 20, attacks: [spark, chaosBolt], attackPower: 7, defense: 6)
    }
}
