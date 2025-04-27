//
//  Thief.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Thief: Hero {
    let quickSlash: Attack = Attack(name: "Quick Slash", powerMultiplier: 1.1, manaCost: 0, type: .damage, infoText: "A rapid slash designed to exploit openings.")
    let backStab: Attack = Attack(name: "Backstab", powerMultiplier: 1.5, manaCost: 2, type: .damage, infoText: "A deadly strike from behind, hitting vital spots.")
    let spikeTrap: Attack = Attack(name: "Spike Trap", powerMultiplier: 1.0, manaCost: 4, type: .trap, infoText: "Sets a trap that springs on the next enemy to cross it, dealing significant damage.")
    let smokeBomb: Attack = Attack(name: "Smoke Bomb", powerMultiplier: 0.7, manaCost: 3, type: .debuffAttack, infoText: "Throws a smoke bomb that disorients the enemy, reducing their attack accuracy.")
    
    init() {
        super.init(name: "Thief", maxHealthPoints: 20, maxManaPoints: 14, attacks: [quickSlash, backStab, spikeTrap, smokeBomb], attackPower: 5, defense: 10)
    }
}
