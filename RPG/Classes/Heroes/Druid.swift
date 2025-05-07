//
//  Druid.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

class Druid: Hero {
    let thornWhip = Attack(name: "Thorn Whip", powerMultiplier: 1.1, manaCost: 2, type: .damage, infoText: "A magical vine lashes the enemy, leaving cuts that sting over time.", isSelfTargeting: false)
    let healingWinds = Attack(name: "Healing Winds", powerMultiplier: 0.0, manaCost: 5, type: .heal, infoText: "A soft breeze soothes wounds and restores vitality.", isSelfTargeting: false)
    let barkSkin = Attack(name: "Barkskin", powerMultiplier: 0.0, manaCost: 4, type: .buffDefense, infoText: "Surrounds the caster in hardened bark, increasing defense.", isSelfTargeting: true)
    let wildSurge = Attack(name: "Wild Surge", powerMultiplier: 1.3, manaCost: 7, type: .areaDamage, infoText: "Unleashes chaotic elemental energy upon all enemies.", isSelfTargeting: false)

    init() {
        super.init(name: "Druid", maxHealthPoints: 26, maxManaPoints: 14, attacks: [thornWhip, healingWinds, barkSkin, wildSurge], attackPower: 6, defense: 9, tempo: 1, classDescription: "A guardian of nature who calls on plants, winds, and beasts to fight. The Druid excels at healing and battlefield control, but has lower raw attack power.")
    }

    override func levelUp() {
        super.levelUp()
        maxManaPoints += 5
        manaPoints = maxManaPoints
        defense += 1
    }
}
