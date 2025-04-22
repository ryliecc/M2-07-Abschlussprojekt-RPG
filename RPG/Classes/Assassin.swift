//
//  Assassin.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Assassin: Hero {
    let shadowJab: Attack = Attack(name: "Shadow Jab", powerMultiplier: 1, manaCost: 0, type: .damage, infoText: "A quick strike from the shadows that catches enemies off guard.")
    let quietDeath: Attack = Attack(name: "Quiet Death", powerMultiplier: 1.5, manaCost: 5, type: .damage, infoText: "A lethal blow delivered in silence, striking where it hurts most.")
    let shadowFocus: Attack = Attack(name: "Shadow Focus", powerMultiplier: 0.8, manaCost: 3, type: .buffAttack, infoText: "The assassin sharpens their senses, increasing attack precision.")
    let poisonedBlade: Attack = Attack(name: "Poisoned Blade", powerMultiplier: 0.6, manaCost: 4, type: .debuffDefense, infoText: "Coats the weapon in venom, weakening the enemy’s defenses.")
    init() {
        super.init(name: "Assassin", maxHealthPoints: 20, healthPoints: 20, maxManaPoints: 10, manaPoints: 10, attacks: [shadowJab, quietDeath, shadowFocus, poisonedBlade], attackPower: 8, defense: 10)
    }
}
