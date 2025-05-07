//
//  Berserker.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

class Berserker: Hero {
    let recklessSwing = Attack(name: "Reckless Swing", powerMultiplier: 1.3, manaCost: 0, type: .damage, infoText: "A wild, all-in attack that leaves both the enemy and the Berserker vulnerable.", isSelfTargeting: false)
    let bloodRage = Attack(name: "Blood Rage", powerMultiplier: 0.0, manaCost: 5, type: .buffAttack, infoText: "Ignites a furious state, boosting attack power but lowering defense.", isSelfTargeting: true)
    let crushingBlow = Attack(name: "Crushing Blow", powerMultiplier: 1.7, manaCost: 6, type: .damage, infoText: "A devastating overhead smash aimed to break armor and spirit.", isSelfTargeting: false)
    let roarOfWrath = Attack(name: "Roar of Wrath", powerMultiplier: 0.6, manaCost: 4, type: .areaDamage, infoText: "Unleashes a deafening roar that rattles all nearby foes.", isSelfTargeting: false)

    init() {
        super.init(name: "Berserker", maxHealthPoints: 35, maxManaPoints: 8, attacks: [recklessSwing, bloodRage, crushingBlow, roarOfWrath], attackPower: 10, defense: 6, tempo: 1, classDescription: "A raging warrior who thrives in the chaos of battle. The Berserker becomes more dangerous the longer the fight lasts, but struggles to defend against precision strikes.")
    }

    override func levelUp() {
        super.levelUp()
        attackPower += 3
        maxHealthPoints += 15
        healthPoints = maxHealthPoints
    }
}
