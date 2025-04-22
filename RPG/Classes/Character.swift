//
//  Character.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Character: CustomStringConvertible {
    let name: String
    let maxHealthPoints: Double
    var healthPoints: Double
    let maxManaPoints: Double
    var manaPoints: Double
    var attacks: [Attack]
    var attackPower: Double
    var defense: Double
    var hasTrap: Bool = false
    var trapDamage: Double = 0
    
    init(name: String, maxHealthPoints: Double, healthPoints: Double, maxManaPoints: Double, manaPoints: Double, attacks: [Attack] = [], attackPower: Double, defense: Double) {
        self.name = name
        self.maxHealthPoints = maxHealthPoints
        self.healthPoints = healthPoints
        self.maxManaPoints = maxManaPoints
        self.manaPoints = manaPoints
        self.attacks = attacks
        self.attackPower = attackPower
        self.defense = defense
    }
    
    var description: String {
        "\(name)\nHP: \(healthPoints)/\(maxHealthPoints)\nMP: \(manaPoints)/\(maxManaPoints)"
    }
    
    func takeDamage(_ amount: Double, from attacker: Character) {
        if hasTrap {
            hasTrap = false
            attacker.takeDamage(trapDamage, from: self)
        }
        healthPoints = max(0, healthPoints - amount)
    }
    
    func attack(_ attack: Attack, on target: Character) {
        guard self.manaPoints >= attack.manaCost else {
            print("\(name) does not have enough MP to perform to use \(attack.name)!")
            return
        }
        manaPoints = max(0, manaPoints - attack.manaCost)
        
        switch attack.type {
        case .damage:
            let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
            target.takeDamage(totalDamage, from: self)
        case .heal:
            let healAmount = self.attackPower * attack.powerMultiplier
            target.healthPoints = min(target.maxHealthPoints, target.healthPoints + healAmount)
        case .manaRestore:
            let manaAmount = self.attackPower * attack.powerMultiplier
            target.manaPoints = min(target.maxManaPoints, target.manaPoints + manaAmount)
        case .trap:
            target.hasTrap = true
            target.trapDamage = self.attackPower * attack.powerMultiplier
        case .buffAttack:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.attackPower += buffAmount
        case .buffDefense:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.defense += buffAmount
        case .debuffAttack:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.attackPower = max(0, target.attackPower - buffAmount)
        case .debuffDefense:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.defense = max(0, target.defense - buffAmount)
        }
    }
}
