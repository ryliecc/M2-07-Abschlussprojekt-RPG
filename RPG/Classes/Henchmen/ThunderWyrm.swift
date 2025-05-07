//
//  ThunderWyrm.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class ThunderWyrm: Henchman {
    let shockwave: Attack = Attack(name: "Shockwave", powerMultiplier: 1, manaCost: 0, type: .damage, infoText: "A quick burst of electricity that strikes a single target.", isSelfTargeting: false)
    let windGust: Attack = Attack(name: "Wind Gust", powerMultiplier: 1, manaCost: 3, type: .areaDamage, infoText: "A gust of wind that knocks back and damages all nearby enemies.", isSelfTargeting: false)
    let lightningLash: Attack = Attack(name: "Lightning Lash", powerMultiplier: 1.4, manaCost: 6, type: .damage, infoText: "The Thunder Wyrm lashes out with a whip of lightning, striking down its enemies.", isSelfTargeting: false)
    let thunderousRoar: Attack = Attack(name: "Thunderous Roar", powerMultiplier: 1.1, manaCost: 6, type: .areaDamage, infoText: "In a fit of rage, the Thunder Wyrm releases a deafening roar that damages all enemies.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Thunder Wyrm", maxHealthPoints: 30, maxManaPoints: 15, standardAttacks: [shockwave, windGust, lightningLash], attackPower: 8, defense: 8, tempo: 2, level: level, healthMultiplier: 2, manaMultiplier: 3, attackMultiplier: 3, defenseMultiplier: 2, tempoMultiplier: 0.1, revengeAttack: thunderousRoar)
    }
}
