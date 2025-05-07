//
//  Assassin.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Assassin: Hero {
    let shadowJab: Attack = Attack(name: "Shadow Jab", powerMultiplier: 1.1, manaCost: 0, type: .damage, infoText: "A swift, precise strike that catches the enemy off guard.", isSelfTargeting: false)
    let quietDeath: Attack = Attack(name: "Quiet Death", powerMultiplier: 1.6, manaCost: 6, type: .damage, infoText: "A lethal strike from the shadows that takes the enemy by surprise.", isSelfTargeting: false)
    let shadowFocus: Attack = Attack(name: "Shadow Focus", powerMultiplier: 0.8, manaCost: 3, type: .buffAttack, infoText: "Sharpening the assassin's focus, increasing attack power and precision for the next strike.", isSelfTargeting: true)
    let poisonedBlade: Attack = Attack(name: "Poisoned Blade", powerMultiplier: 0.7, manaCost: 4, type: .debuffDefense, infoText: "The blade is coated in a venomous poison, slowly weakening the enemy's defenses.", isSelfTargeting: false)
    
    init() {
        super.init(name: "Assassin", maxHealthPoints: 22, maxManaPoints: 12, attacks: [shadowJab, quietDeath, shadowFocus, poisonedBlade], attackPower: 8, defense: 12, tempo: 1, classDescription: "A silent predator lurking in the shadows. The Assassin excels at precise strikes and weakening enemies before they even know what hit them. But once discovered, they can be easily overpowered.")
    }
    
    override func levelUp() {
        super.levelUp()
        attackPower += 2
        defense += 2
    }
}
