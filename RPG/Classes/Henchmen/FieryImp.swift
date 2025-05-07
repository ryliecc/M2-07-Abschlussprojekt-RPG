//
//  FieryImp.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class FieryImp: Henchman {
    let fireball: Attack = Attack(name: "Fireball", powerMultiplier: 1.2, manaCost: 4, type: .damage, infoText: "The Fiery Imp launches a small but fast-moving fireball.", isSelfTargeting: false)
    let flameShield: Attack = Attack(name: "Flame Shield", powerMultiplier: 0.4, manaCost: 0, type: .buffDefense, infoText: "The Imp conjures a shield of flame, reducing incoming damage.", isSelfTargeting: true)
    let fieryDash: Attack = Attack(name: "Fiery Dash", powerMultiplier: 1.5, manaCost: 3, type: .damage, infoText: "The Fiery Imp dashes forward, leaving a trail of fire in his wake.", isSelfTargeting: false)
    let wrathOfTheInferno: Attack = Attack(name: "Wrath of the Inferno", powerMultiplier: 1.8, manaCost: 6, type: .damage, infoText: "Fueled by the Infernal Demon’s power, the Fiery Imp strikes with intense fury.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Fiery Imp", maxHealthPoints: 25, maxManaPoints: 5, standardAttacks: [fireball, flameShield, fieryDash], attackPower: 5, defense: 2, tempo: 1, level: level, healthMultiplier: 2, manaMultiplier: 3, attackMultiplier: 3, defenseMultiplier: 2, tempoMultiplier: 0.1, revengeAttack: wrathOfTheInferno)
    }
}
