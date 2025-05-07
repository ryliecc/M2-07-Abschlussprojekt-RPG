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
    let venomSpit = Attack(name: "Venom Spit", powerMultiplier: 0.6, manaCost: 2, type: .debuffDefense, infoText: "Spits venom to corrode the enemy's armor.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Cave Spider", maxHealthPoints: 16, maxManaPoints: 7, attacks: [bite, webTrap, venomSpit], attackPower: 5, defense: 5, tempo: 1.1, level: level, healthMultiplier: 2, manaMultiplier: 3.2, attackMultiplier: 2.7, defenseMultiplier: 2.0, tempoMultiplier: 0.2)
    }
}
