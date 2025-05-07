//
//  InfernalDemon.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class InfernalDemon: Boss {
    let hellfire: Attack = Attack(name: "Hellfire", powerMultiplier: 1.5, manaCost: 10, type: .damage, infoText: "The Infernal Demon summons a wave of hellfire, incinerating anything in its path.", isSelfTargeting: false)
    let flameWave: Attack = Attack(name: "Flame Wave", powerMultiplier: 1.2, manaCost: 5, type: .areaDamage, infoText: "A large wave of fire spreads across the battlefield, scorching enemies in its path.", isSelfTargeting: false)
    let demonicRoar: Attack = Attack(name: "Demonic Roar", powerMultiplier: 0.6, manaCost: 0, type: .buffAttack, infoText: "The Demon lets out a fearsome roar, bolstering his own strength.", isSelfTargeting: true)
    let infernoFury: Attack = Attack(name: "Inferno Fury", powerMultiplier: 2.0, manaCost: 20, type: .ultimate, infoText: "The Demon unleashes his full fury, causing an explosive eruption of flame.", isSelfTargeting: false)
    
    init(level: Int, henchmanLevel: Int) {
        super.init(name: "Infernal Demon", maxHealthPoints: 65, maxManaPoints: 20, attacks: [hellfire, flameWave, demonicRoar, infernoFury], attackPower: 13, defense: 6, tempo: 1, level: level, healthMultiplier: 2, manaMultiplier: 2, attackMultiplier: 2, defenseMultiplier: 1, tempoMultiplier: 0.1, dedicatedHenchman: FieryImp(level: henchmanLevel))
    }
}
