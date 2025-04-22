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
    let shadowFocus: Attack = Attack(name: "Shadow Focus", powerMultiplier: 0.8, manaCost: 3, type: .buffAttack)
    let poisonedBlade: Attack = Attack(name: "Poisoned Blade", powerMultiplier: 0.6, manaCost: 4, type: .debuffDefense)
    init() {
        super.init(name: "Assassin", maxHealthPoints: 20, healthPoints: 20, maxManaPoints: 10, manaPoints: 10, attacks: [shadowJab, quietDeath, shadowFocus, poisonedBlade], attackPower: 8, defense: 10)
    }
}
