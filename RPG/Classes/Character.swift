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
    
    func takeDamage(_ amount: Double) {
        healthPoints = max(0, healthPoints - amount)
    }
    
    func attack(_ attack: Attack, on target: Character) {
        if self.manaPoints >= attack.manaCost {
            manaPoints = max(0, manaPoints - attack.manaCost)
            let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
            target.takeDamage(totalDamage)
        } else {
            print("\(name) does not have enough MP to perform to use \(attack.name)!")
        }
    }
}
