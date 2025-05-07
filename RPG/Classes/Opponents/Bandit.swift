//
//  Bandit.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class Bandit: Opponent {
    let slash = Attack(name: "Slash", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A quick and dirty slash attack.", isSelfTargeting: false)
    let dirtyTrick = Attack(name: "Dirty Trick", powerMultiplier: 0.8, manaCost: 2, type: .debuffDefense, infoText: "Throws sand to weaken the enemy's guard.", isSelfTargeting: false)
    let feint = Attack(name: "Feint", powerMultiplier: 0.6, manaCost: 3, type: .debuffAttack, infoText: "A misleading move that lowers the opponent's attack.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Bandit", maxHealthPoints: 18, maxManaPoints: 6, attacks: [slash, dirtyTrick, feint], attackPower: 6, defense: 4, tempo: 1.2, level: level, healthMultiplier: 2.2, manaMultiplier: 2.5, attackMultiplier: 2.8, defenseMultiplier: 1.8, tempoMultiplier: 0.1)
    }
}
