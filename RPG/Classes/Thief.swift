//
//  Thief.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Thief: Hero {
    let quickSlash: Attack = Attack(name: "Quick Slash", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A fast and nimble attack aimed at exposed spots.")
    let backStab: Attack = Attack(name: "Backstab", powerMultiplier: 1.3, manaCost: 2, type: .damage, infoText: "Strikes from behind, exploiting the enemy’s blind spot.")
    let spikeTrap: Attack = Attack(name: "Spike Trap", powerMultiplier: 1.0, manaCost: 4, type: .trap, infoText: "Lays a hidden trap that springs on the next attacker.")
    let smokeBomb: Attack = Attack(name: "Smoke Bomb", powerMultiplier: 0.8, manaCost: 3, type: .debuffAttack, infoText: "A cloud of smoke disorients the foe, dulling their attacks.")
    init() {
        super.init(name: "Thief", maxHealthPoints: 20, maxManaPoints: 12, attacks: [quickSlash, backStab, spikeTrap, smokeBomb], attackPower: 4, defense: 10)
    }
}
