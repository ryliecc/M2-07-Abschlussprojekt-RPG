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
    let pounce = Attack(name: "Pounce", powerMultiplier: 1.1, manaCost: 2, type: .damage, infoText: "Leaps onto the target with brute force.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Forest Wolf", maxHealthPoints: 17, maxManaPoints: 5, attacks: [bite, howl, pounce], attackPower: 6, defense: 3, tempo: 1.3, level: level, healthMultiplier: 2, manaMultiplier: 2.8, attackMultiplier: 3, defenseMultiplier: 1.5, tempoMultiplier: 0.2)
    }
}
