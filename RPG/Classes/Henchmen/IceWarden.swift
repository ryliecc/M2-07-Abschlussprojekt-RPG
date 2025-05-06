//
//  IceWarden.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class IceWarden: Henchman {
    let icyStrike: Attack = Attack(name: "Icy Strike", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A basic strike imbued with cold energy, slowing the target’s movements.", isSelfTargeting: false)
    let frostAura: Attack = Attack(name: "Frost Aura", powerMultiplier: 1.2, manaCost: 3, type: .buffDefense, infoText: "The Ice Warden emanates a cold aura, boosting his defense and lowering enemies' attack power.", isSelfTargeting: true)
    let freezingCharge: Attack = Attack(name: "Freezing Charge", powerMultiplier: 1.5, manaCost: 5, type: .damage, infoText: "The Warden charges forward, freezing everything in his path.", isSelfTargeting: false)
    let iceboundVengeance: Attack = Attack(name: "Icebound Vengeance", powerMultiplier: 1.8, manaCost: 7, type: .areaDamage, infoText: "Fueled by vengeance, the Warden releases a deadly burst of freezing energy.", isSelfTargeting: false)
    
    init() {
        super.init(name: "Ice Warden", maxHealthPoints: 30, maxManaPoints: 10, standardAttacks: [icyStrike, frostAura, freezingCharge], attackPower: 6, defense: 6, revengeAttack: iceboundVengeance)
    }
}
