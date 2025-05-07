//
//  GoblinScout.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class GoblinScout: Opponent {
    let stab = Attack(name: "Stab", powerMultiplier: 0.9, manaCost: 0, type: .damage, infoText: "A quick stab with a rusty dagger.", isSelfTargeting: false)
    let dodge = Attack(name: "Dodge", powerMultiplier: 0.8, manaCost: 2, type: .buffDefense, infoText: "The goblin dodges, boosting its defense temporarily.", isSelfTargeting: true)
    let quickStrike = Attack(name: "Quick Strike", powerMultiplier: 0.7, manaCost: 1, type: .damage, infoText: "A blindingly fast attack.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Goblin Scout", maxHealthPoints: 14, maxManaPoints: 6, attacks: [stab, dodge, quickStrike], attackPower: 5, defense: 3, tempo: 1.4, level: level, healthMultiplier: 1.9, manaMultiplier: 3.2, attackMultiplier: 2.8, defenseMultiplier: 1.6, tempoMultiplier: 0.3)
    }
}
