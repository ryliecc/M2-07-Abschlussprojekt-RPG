//
//  GoblinScout.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class GoblinScout: Opponent {
    let stab = Attack(name: "Stab", powerMultiplier: 0.9, manaCost: 0, type: .damage, infoText: "A quick stab with a rusty dagger.")
    let dodge = Attack(name: "Dodge", powerMultiplier: 0.8, manaCost: 2, type: .buffDefense, infoText: "The goblin dodges, boosting its defense temporarily.")
    
    init() {
        super.init(name: "Goblin Scout", maxHealthPoints: 15, maxManaPoints: 5, attacks: [stab, dodge], attackPower: 5, defense: 3)
    }
}
