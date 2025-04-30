//
//  Pyromancer.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

class Pyromancer: Hero {
    let firebolt: Attack = Attack(name: "Firebolt", powerMultiplier: 1.2, manaCost: 3, type: .damage, infoText: "Shoots a blazing bolt of fire at the enemy.")
    let ignite: Attack = Attack(name: "Ignite", powerMultiplier: 1.0, manaCost: 6, type: .areaDamage, infoText: "Sets the entire enemy group ablaze.")
    let flameAura: Attack = Attack(name: "Flame Aura", powerMultiplier: 0.6, manaCost: 4, type: .buffAttack, infoText: "Surrounds the caster in flame, boosting spell power.")
    let manaSurge: Attack = Attack(name: "Mana Surge", powerMultiplier: 1.0, manaCost: 0, type: .manaRestore, infoText: "Draws in ambient magic to restore mana.")

    init() {
        super.init(name: "Pyromancer", maxHealthPoints: 20, maxManaPoints: 20, attacks: [firebolt, ignite, flameAura, manaSurge], attackPower: 7, defense: 8)
    }

    override func levelUp() {
        super.levelUp()
        maxManaPoints += 6
        attackPower += 2
    }
}
