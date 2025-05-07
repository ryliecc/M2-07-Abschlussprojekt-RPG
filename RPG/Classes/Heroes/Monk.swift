//
//  Monk.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

class Monk: Hero {
    let innerStrike = Attack(name: "Inner Strike", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A focused punch that channels the user's inner energy.", isSelfTargeting: false)
    let meditation = Attack(name: "Meditation", powerMultiplier: 0.0, manaCost: 3, type: .heal, infoText: "Centers the body and spirit to restore health.", isSelfTargeting: true)
    let counterStance = Attack(name: "Counter Stance", powerMultiplier: 0.6, manaCost: 4, type: .buffDefense, infoText: "Prepares the Monk to absorb and redirect incoming blows.", isSelfTargeting: true)
    let chiBurst = Attack(name: "Chi Burst", powerMultiplier: 1.4, manaCost: 6, type: .areaDamage, infoText: "Unleashes a wave of spiritual force against all enemies.", isSelfTargeting: false)

    init() {
        super.init(name: "Monk", maxHealthPoints: 28, maxManaPoints: 10, attacks: [innerStrike, meditation, counterStance, chiBurst], attackPower: 7, defense: 11, tempo: 1, classDescription: "A disciplined fighter who combines martial arts with inner balance. The Monk uses meditation, rapid strikes, and counterattacks. But their strength depends on rhythm and timing.")
        }
    
    override func levelUp() {
            super.levelUp()
            attackPower += 2
            defense += 2
            maxManaPoints += 3
            manaPoints = maxManaPoints
        }
}
