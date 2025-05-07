//
//  Paladin.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

class Paladin: Hero {
    let smite: Attack = Attack(name: "Smite", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A righteous blow empowered by divine force.", isSelfTargeting: false)
    let divineShield: Attack = Attack(name: "Divine Shield", powerMultiplier: 0.8, manaCost: 4, type: .buffDefense, infoText: "Envelops the body in holy energy, increasing defense.", isSelfTargeting: true)
    let healingLight: Attack = Attack(name: "Healing Light", powerMultiplier: 1.0, manaCost: 5, type: .heal, infoText: "A warm light restores wounds and strengthens resolve.", isSelfTargeting: false)
    let judgment: Attack = Attack(name: "Judgment", powerMultiplier: 2.0, manaCost: 8, type: .ultimate, infoText: "Unleashes divine wrath in a devastating attack.", isSelfTargeting: false)

    init() {
        super.init(name: "Paladin", maxHealthPoints: 28, maxManaPoints: 14, attacks: [smite, divineShield, healingLight, judgment], attackPower: 6, defense: 16, tempo: 1, classDescription: "A holy knight whose strength lies in unwavering defense. The Paladin protects the party, heals wounds, and strikes with divine justice. However, their offensive capabilities are limited.")
    }

    override func levelUp() {
        super.levelUp()
        defense += 3
        maxHealthPoints += 2
    }
}
