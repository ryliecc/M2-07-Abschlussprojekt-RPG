//
//  IceWarden.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class IceWarden: Henchman {
    let icyStrike: Attack = Attack(name: "Icy Strike", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A basic strike imbued with cold energy, slowing the target’s movements.", isSelfTargeting: false)
    let frostAura: Attack = Attack(name: "Frost Aura", powerMultiplier: 0.8, manaCost: 3, type: .buffDefense, infoText: "The Ice Warden emanates a cold aura, boosting his defense.", isSelfTargeting: true)
    let freezingCharge: Attack = Attack(name: "Freezing Charge", powerMultiplier: 1.5, manaCost: 5, type: .damage, infoText: "The Warden charges forward, freezing everything in his path.", isSelfTargeting: false)
    let iceboundVengeance: Attack = Attack(name: "Icebound Vengeance", powerMultiplier: 1.8, manaCost: 6, type: .areaDamage, infoText: "Fueled by vengeance, the Warden releases a deadly burst of freezing energy.", isSelfTargeting: false)
    
    init(level: Int) {
        super.init(name: "Ice Warden", maxHealthPoints: 30, maxManaPoints: 10, standardAttacks: [icyStrike, frostAura, freezingCharge], attackPower: 6, defense: 6, tempo: 1, level: level, healthMultiplier: 2, manaMultiplier: 3, attackMultiplier: 3, defenseMultiplier: 2, tempoMultiplier: 0.1, revengeAttack: iceboundVengeance)
    }
}
