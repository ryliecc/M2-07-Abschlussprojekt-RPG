//
//  ForestWolf.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class ForestWolf: Opponent {
    let bite = Attack(name: "Bite", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A vicious bite aimed at vulnerable spots.", isSelfTargeting: false)
    let howl = Attack(name: "Howl", powerMultiplier: 0.7, manaCost: 3, type: .buffAttack, infoText: "A chilling howl that boosts its attack.", isSelfTargeting: true)
    
    init(level: Int) {
        super.init(name: "Forest Wolf", maxHealthPoints: 18, maxManaPoints: 4, attacks: [bite, howl], attackPower: 6, defense: 4, tempo: 1, level: level, healthMultiplier: 2, manaMultiplier: 3, attackMultiplier: 3, defenseMultiplier: 2, tempoMultiplier: 1)
    }
}
