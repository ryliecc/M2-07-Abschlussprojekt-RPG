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
    
    init() {
        super.init(name: "Skeletal Minion", maxHealthPoints: 17, maxManaPoints: 5, attacks: [boneStrike, eeriePresence], attackPower: 6, defense: 5)
    }
}
