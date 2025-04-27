//
//  Sorcerer.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Sorcerer: Hero {
    let spark: Attack = Attack(name: "Spark", powerMultiplier: 0.8, manaCost: 0, type: .damage, infoText: "A small jolt of magical energy shocks the opponent.")
    let chaosBolt: Attack = Attack(name: "Chaos Bolt", powerMultiplier: 1.2, manaCost: 4, type: .damage, infoText: "A surge of unstable arcane energy explodes upon impact.")
    let arcaneHeal: Attack = Attack(name: "Arcane Heal", powerMultiplier: 1, manaCost: 5, type: .heal, infoText: "Channels ancient magic to mend wounds and restore vitality.")
    let manaInfusion: Attack = Attack(name: "Mana Infusion", powerMultiplier: 1.2, manaCost: 5, type: .manaRestore, infoText: "Taps into the arcane flow to replenish magical reserves.")
    let curseOfWeakness: Attack = Attack(name: "Curse of Weakness", powerMultiplier: 0.8, manaCost: 4, type: .debuffAttack, infoText: "A dark incantation that saps the enemy’s strength.")
    
    init() {
        super.init(name: "Sorcerer", maxHealthPoints: 25, maxManaPoints: 20, attacks: [spark, chaosBolt, arcaneHeal, manaInfusion, curseOfWeakness], attackPower: 7, defense: 6)
    }
}
