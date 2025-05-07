//
//  CaveSpider.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class CaveSpider: Opponent {
    let bite = Attack(name: "Venomous Bite", powerMultiplier: 0.9, manaCost: 0, type: .damage, infoText: "A poisonous bite that weakens the enemy.", isSelfTargeting: false)
    let webTrap = Attack(name: "Web Trap", powerMultiplier: 0.7, manaCost: 3, type: .debuffAttack, infoText: "Spins a web to slow and weaken the enemy's strikes.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Cave Spider", maxHealthPoints: 16, maxManaPoints: 6, attacks: [bite, webTrap], attackPower: 5, defense: 6, level: level, healthMultiplier: 2, manaMultiplier: 3, attackMultiplier: 3, defenseMultiplier: 2)
    }
}
