//
//  Sorcerer.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Sorcerer: Hero {
    let spark: Attack = Attack(name: "Spark", powerMultiplier: 0.8, manaCost: 0, type: .damage, infoText: "A small burst of magical energy that zaps the enemy.")
    let chaosBolt: Attack = Attack(name: "Chaos Bolt", powerMultiplier: 1.3, manaCost: 5, type: .damage, infoText: "A violent arcane blast that explodes on impact.")
    let arcaneHeal: Attack = Attack(name: "Arcane Heal", powerMultiplier: 1.0, manaCost: 5, type: .heal, infoText: "A soothing spell that mends the wounds of allies, restoring health.")
    let curseOfWeakness: Attack = Attack(name: "Curse of Weakness", powerMultiplier: 0.9, manaCost: 4, type: .debuffAttack, infoText: "A dark curse that weakens the enemy, lowering their attack power.")
    
    init() {
        super.init(name: "Sorcerer", maxHealthPoints: 22, maxManaPoints: 20, attacks: [spark, chaosBolt, arcaneHeal, curseOfWeakness], attackPower: 7, defense: 6, classDescription: "A mysterious spellcaster whose powers stem from ancient runes. The Sorcerer manipulates the battlefield with curses, teleportation, and arcane buffs. But their fragile body requires protection from allies.")
    }
    
    override func levelUp() {
        super.levelUp()
        maxManaPoints += 10
        manaPoints = maxManaPoints
    }
}
