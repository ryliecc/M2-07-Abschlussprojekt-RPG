//
//  SkeletalMinion.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class SkeletalMinion: Opponent {
    let boneStrike = Attack(name: "Bone Strike", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A heavy swing with a broken bone.", isSelfTargeting: false)
    let eeriePresence = Attack(name: "Eerie Presence", powerMultiplier: 0.7, manaCost: 2, type: .debuffDefense, infoText: "A chilling aura that weakens the enemy's defense.", isSelfTargeting: false)
    let boneShield = Attack(name: "Bone Shield", powerMultiplier: 0.0, manaCost: 3, type: .buffDefense, infoText: "Raises a bony shield to defend itself.", isSelfTargeting: true)
    
    init(level: Int) {
        super.init(name: "Skeletal Minion", maxHealthPoints: 17, maxManaPoints: 6, attacks: [boneStrike, eeriePresence, boneShield], attackPower: 6, defense: 5, tempo: 1, level: level, healthMultiplier: 2.1, manaMultiplier: 3, attackMultiplier: 2.7, defenseMultiplier: 2.2, tempoMultiplier: 0.1)
    }
}
