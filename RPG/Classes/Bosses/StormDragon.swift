//
//  StormDragon.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class StormDragon: Boss {
    let thunderstrike: Attack = Attack(name: "Thunder Strike", powerMultiplier: 1.4, manaCost: 8, type: .damage, infoText: "The Storm Dragon summons a bolt of lightning, striking down from the sky.", isSelfTargeting: false)
    let windSlash: Attack = Attack(name: "Wind Slash", powerMultiplier: 1.1, manaCost: 5, type: .areaDamage, infoText: "A sharp slash of wind that cuts through all enemies in a line.", isSelfTargeting: false)
    let lightningShield: Attack = Attack(name: "Lightning Shield", powerMultiplier: 1.0, manaCost: 0, type: .buffDefense, infoText: "The Dragon surrounds itself with a shield of crackling lightning, boosting its defense.", isSelfTargeting: true)
    let stormsFury: Attack = Attack(name: "Storm's Fury", powerMultiplier: 2.5, manaCost: 35, type: .ultimate, infoText: "The Storm Dragon unleashes a powerful storm, causing massive damage to all enemies.", isSelfTargeting: false)
    
    init(level: Int, henchmanLevel: Int) {
        super.init(name: "Storm Dragon", maxHealthPoints: 90, maxManaPoints: 35, attacks: [thunderstrike, windSlash, lightningShield, stormsFury], attackPower: 14, defense: 10, tempo: 1, level: level, healthMultiplier: 2, manaMultiplier: 2, attackMultiplier: 2, defenseMultiplier: 2, tempoMultiplier: 0.1, dedicatedHenchman: ThunderWyrm(level: henchmanLevel))
    }
}
