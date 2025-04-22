//
//  Sorcerer.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Sorcerer: Hero {
    let spark: Attack = Attack(name: "Spark", powerMultiplier: 0.8, manaCost: 0, type: .damage)
    let chaosBolt: Attack = Attack(name: "Chaos Bolt", powerMultiplier: 1.2, manaCost: 4, type: .damage)
    let arcaneHeal: Attack = Attack(name: "Arcane Heal", powerMultiplier: 1, manaCost: 5, type: .heal)
    let manaInfusion: Attack = Attack(name: "Mana Infusion", powerMultiplier: 1.2, manaCost: 5, type: .manaRestore)
    let curseOfWeakness: Attack = Attack(name: "Curse of Weakness", powerMultiplier: 0.8, manaCost: 4, type: .debuffAttack)
    init() {
        super.init(name: "Sorcerer", maxHealthPoints: 25, healthPoints: 25, maxManaPoints: 20, manaPoints: 20, attacks: [spark, chaosBolt, arcaneHeal, manaInfusion, curseOfWeakness], attackPower: 7, defense: 6)
    }
}
