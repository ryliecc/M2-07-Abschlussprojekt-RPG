//
//  Beastmaster.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

class Beastmaster: Hero {
    let fangStrike: Attack = Attack(name: "Fang Strike", powerMultiplier: 1.3, manaCost: 0, type: .damage, infoText: "A wild melee strike mimicking a beast's bite.", isSelfTargeting: false)
    let animalCompanion: Attack = Attack(name: "Animal Companion", powerMultiplier: 1.2, manaCost: 5, type: .damage, infoText: "Summons a loyal creature to strike the foe.", isSelfTargeting: false)
    let sharpenSenses: Attack = Attack(name: "Sharpen Senses", powerMultiplier: 0.6, manaCost: 3, type: .buffAttack, infoText: "Heightens reflexes and focus for stronger attacks.", isSelfTargeting: true)
    let snareTrap: Attack = Attack(name: "Snare Trap", powerMultiplier: 1.1, manaCost: 4, type: .trap, infoText: "Lays a hidden trap to punish attackers.", isSelfTargeting: true)

    init() {
        super.init(name: "Beastmaster", maxHealthPoints: 26, maxManaPoints: 10, attacks: [fangStrike, animalCompanion, sharpenSenses, snareTrap], attackPower: 7, defense: 12, tempo: 1, classDescription: "A wild-hearted warrior who fights alongside their loyal beasts. The Beastmaster overwhelms foes with brute strength and animal instincts. But without their companions, they’re far less threatening.")
    }

    override func levelUp() {
        super.levelUp()
        maxHealthPoints += 2
        healthPoints = maxHealthPoints
        attackPower += 1
        defense += 1
        tempo += 0.1
    }
}
