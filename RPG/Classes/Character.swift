//
//  Character.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Character: CustomStringConvertible, Equatable {
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
            print("\(name)'s trap is triggered.")
            attacker.takeDamage(trapDamage, from: self)
            print("\(attacker.name) takes \(trapDamage) damage from the trap.")
        }
        healthPoints = max(0, healthPoints - amount)
    }
    
    func attack(_ attack: Attack, on target: Character) {
        guard self.manaPoints >= attack.manaCost else {
            print("\(name) does not have enough MP to perform to use \(attack.name)!")
            return
        }
        manaPoints = max(0, manaPoints - attack.manaCost)
        print("\(name) uses \(attack.name) on \(self == target ? "themself" : target.name).")
        
        switch attack.type {
        case .damage:
            let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
            target.takeDamage(totalDamage, from: self)
            print("It deals \(totalDamage) damage.")
        case .heal:
            let healAmount = self.attackPower * attack.powerMultiplier
            target.healthPoints = min(target.maxHealthPoints, target.healthPoints + healAmount)
            print("\(name) heals \(self == target ? "themselves" : target.name) for \(healAmount) HP.")
        case .manaRestore:
            let manaAmount = self.attackPower * attack.powerMultiplier
            target.manaPoints = min(target.maxManaPoints, target.manaPoints + manaAmount)
            print("\(name) restores \(manaAmount) MP to \(self == target ? "themselves" : target.name).")
        case .trap:
            target.hasTrap = true
            target.trapDamage = self.attackPower * attack.powerMultiplier
            print("\(name) sets a trap in front of \(self == target ? "themself" : target.name)!")
        case .buffAttack:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.attackPower += buffAmount
            print("\(name) boosts \(self == target ? "their own" : "\(target.name)'s") attack power by \(buffAmount).")
        case .buffDefense:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.defense += buffAmount
            print("\(name) boosts \(self == target ? "their own" : "\(target.name)'s") defense by \(buffAmount).")
        case .debuffAttack:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.attackPower = max(0, target.attackPower - buffAmount)
            print("\(name) weakens \(target.name)'s attack power by \(buffAmount).")
        case .debuffDefense:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.defense = max(0, target.defense - buffAmount)
            print("\(name) reduces \(target.name)'s defense by \(buffAmount).")
        }
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name
    }
}
