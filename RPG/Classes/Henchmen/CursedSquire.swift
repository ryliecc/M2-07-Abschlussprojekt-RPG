//
//  CursedSquire.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class CursedSquire: Henchman {
    let cursedSlash: Attack = Attack(name: "Cursed Slash", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "The Cursed Squire strikes with a sword that is tainted by dark magic, making each hit feel colder.", isSelfTargeting: false)
    let squiresDefense: Attack = Attack(name: "Squire's Defense", powerMultiplier: 1.0, manaCost: 0, type: .buffDefense, infoText: "The Cursed Squire raises his shield, bracing for the next attack.", isSelfTargeting: true)
    let vengefulCharge: Attack = Attack(name: "Vengeful Charge", powerMultiplier: 1.5, manaCost: 3, type: .damage, infoText: "The Cursed Squire charges into battle with a savage swing of his sword, dealing more damage when enraged.", isSelfTargeting: false)
    let wrathfulFury: Attack = Attack(name: "Wrathful Fury", powerMultiplier: 2.0, manaCost: 5, type: .damage, infoText: "When consumed by rage, the Cursed Squire strikes with an unstoppable fury, dealing devastating damage.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Cursed Squire", maxHealthPoints: 20, maxManaPoints: 5, standardAttacks: [cursedSlash, squiresDefense, vengefulCharge], attackPower: 6, defense: 4, tempo: 1, level: level, healthMultiplier: 2, manaMultiplier: 3, attackMultiplier: 3, defenseMultiplier: 2, tempoMultiplier: 1, revengeAttack: wrathfulFury)
    }
}
