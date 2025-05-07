//
//  Ronin.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

class Ronin: Hero {
    let quickSlash: Attack = Attack(name: "Quick Slash", powerMultiplier: 1.1, manaCost: 0, type: .damage, infoText: "A fast and sharp slash aimed at vital spots.", isSelfTargeting: false)
    let focusedStrike: Attack = Attack(name: "Focused Strike", powerMultiplier: 1.7, manaCost: 5, type: .damage, infoText: "A precise, deliberate blow with deadly intent.", isSelfTargeting: false)
    let innerCalm: Attack = Attack(name: "Inner Calm", powerMultiplier: 0.9, manaCost: 3, type: .buffDefense, infoText: "Focuses breath and stance to increase defense.", isSelfTargeting: true)
    let shadowStep: Attack = Attack(name: "Shadow Step", powerMultiplier: 0.8, manaCost: 4, type: .trap, infoText: "Steps out of sight, preparing a counterattack.", isSelfTargeting: true)

    init() {
        super.init(name: "Ronin", maxHealthPoints: 24, maxManaPoints: 12, attacks: [quickSlash, focusedStrike, innerCalm, shadowStep], attackPower: 9, defense: 10, tempo: 0.5, classDescription: "A wandering swordsman who fights with honor and precision. The Ronin excels at counterattacks and devastating finishers, but must manage their energy carefully and fight alone.")
    }

    override func levelUp() {
        super.levelUp()
        attackPower += 2
        defense += 1
        maxHealthPoints += 2
        healthPoints = maxHealthPoints
        maxManaPoints += 1
        manaPoints = maxManaPoints
        tempo += 0.2
    }
}
