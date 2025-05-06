//
//  FrostKing.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class FrostKing: Boss {
    let blizzard: Attack = Attack(name: "Blizzard", powerMultiplier: 1.3, manaCost: 12, type: .areaDamage, infoText: "The Frost King summons a powerful blizzard that freezes enemies in their tracks.", isSelfTargeting: false)
    let frostbite: Attack = Attack(name: "Frostbite", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A chilling strike that drains the warmth from its target, slowing their movements.", isSelfTargeting: false)
    let iceShield: Attack = Attack(name: "Ice Shield", powerMultiplier: 1.0, manaCost: 5, type: .buffDefense, infoText: "The King envelops himself in a protective shield of ice, increasing his defense.", isSelfTargeting: true)
    let glacialWrath: Attack = Attack(name: "Glacial Wrath", powerMultiplier: 2.0, manaCost: 25, type: .ultimate, infoText: "The Frost King unleashes his ultimate power, summoning a wave of ice and frost to obliterate his enemies.", isSelfTargeting: false)
    
    init() {
        super.init(name: "Frost King", maxHealthPoints: 100, maxManaPoints: 40, attacks: [blizzard, frostbite, iceShield, glacialWrath], attackPower: 12, defense: 14, dedicatedHenchman: IceWarden())
    }
}
