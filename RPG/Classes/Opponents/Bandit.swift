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
    
    init() {
        super.init(name: "Bandit", maxHealthPoints: 20, maxManaPoints: 5, attacks: [slash, dirtyTrick], attackPower: 7, defense: 5)
    }
}
