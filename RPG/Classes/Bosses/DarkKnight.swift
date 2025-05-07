//
//  DarkKnight.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class DarkKnight: Boss {
    let shadowSlash: Attack = Attack(name: "Shadow Slash", powerMultiplier: 1.2, manaCost: 0, type: .damage, infoText: "The Dark Knight swings his cursed sword, leaving a trail of shadows that slice through the air.", isSelfTargeting: false)
    let darkShield: Attack = Attack(name: "Dark Shield", powerMultiplier: 1.0, manaCost: 4, type: .buffDefense, infoText: "The Dark Knight summons a shield of dark energy, granting him protection against attacks.", isSelfTargeting: true)
    let reapersWrath: Attack = Attack(name: "Reaper's Wrath", powerMultiplier: 2.0, manaCost: 10, type: .ultimate, infoText: "The Dark Knight channels the essence of death, delivering a massive blow that devastates the enemy.", isSelfTargeting: false)
    let soulDrain: Attack = Attack(name: "Soul Drain", powerMultiplier: 1.5, manaCost: 5, type: .heal, infoText: "The Dark Knight drains the soul of his enemies, restoring his own health by absorbing their life force.", isSelfTargeting: true)
    
    init(level: Int, henchmanLevel: Int) {
        super.init(name: "Dark Knight", maxHealthPoints: 40, maxManaPoints: 15, attacks: [shadowSlash, darkShield, reapersWrath, soulDrain], attackPower: 12, defense: 8, level: level, healthMultiplier: 2, manaMultiplier: 3, attackMultiplier: 3, defenseMultiplier: 2, dedicatedHenchman: CursedSquire(level: henchmanLevel))
    }
}
