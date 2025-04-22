//
//  Assassin.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Assassin: Hero {
    let shadowJab: Attack = Attack(name: "Shadow Jab", powerMultiplier: 1, manaCost: 0, type: .damage)
    let quietDeath: Attack = Attack(name: "Quiet Death", powerMultiplier: 1.5, manaCost: 5, type: .damage)
    init() {
        super.init(name: "Assassin", maxHealthPoints: 20, healthPoints: 20, maxManaPoints: 10, manaPoints: 10, attacks: [shadowJab, quietDeath], attackPower: 8, defense: 10)
    }
}
