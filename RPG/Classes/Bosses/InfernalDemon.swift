//
//  InfernalDemon.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class InfernalDemon: Boss {
    let hellfire: Attack = Attack(name: "Hellfire", powerMultiplier: 1.5, manaCost: 10, type: .damage, infoText: "The Infernal Demon summons a wave of hellfire, incinerating anything in its path.")
    let flameWave: Attack = Attack(name: "Flame Wave", powerMultiplier: 1.2, manaCost: 5, type: .areaDamage, infoText: "A large wave of fire spreads across the battlefield, scorching enemies in its path.")
    let demonicRoar: Attack = Attack(name: "Demonic Roar", powerMultiplier: 1.0, manaCost: 0, type: .buffAttack, infoText: "The Demon lets out a fearsome roar, bolstering his own strength.")
    let infernoFury: Attack = Attack(name: "Inferno Fury", powerMultiplier: 2.0, manaCost: 20, type: .ultimate, infoText: "The Demon unleashes his full fury, causing an explosive eruption of flame.")
    
    init() {
        super.init(name: "Infernal Demon", maxHealthPoints: 80, maxManaPoints: 30, attacks: [hellfire, flameWave, demonicRoar, infernoFury], attackPower: 15, defense: 10, dedicatedHenchman: FieryImp())
    }
}
