//
//  Character.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Character: CustomStringConvertible, Equatable {
    let name: String
    var maxHealthPoints: Double
    var healthPoints: Double
    var maxManaPoints: Double
    var manaPoints: Double
    var attacks: [Attack]
    var attackPower: Double
    var defense: Double
    var hasTrap: Bool = false
    var trapDamage: Double = 0
    var hasUsedUltimate = false
    
    init(name: String, maxHealthPoints: Double, maxManaPoints: Double, attacks: [Attack] = [], attackPower: Double, defense: Double) {
        self.name = name
        self.maxHealthPoints = maxHealthPoints
        self.healthPoints = maxHealthPoints
        self.maxManaPoints = maxManaPoints
        self.manaPoints = maxManaPoints
        self.attacks = attacks
        self.attackPower = attackPower
        self.defense = defense
    }
    
    var description: String {
        let healthPointsBar = "HP".progressBar(for: healthPoints, maxValue: maxHealthPoints)
        let manaPointsBar = "MP".progressBar(for: manaPoints, maxValue: maxManaPoints)
        return "\(name)\n\(healthPointsBar)\n\(manaPointsBar)"
    }
    
    func takeDamage(_ amount: Double, from attacker: Character) {
        if hasTrap {
            hasTrap = false
            print("\(name)'s trap is triggered.")
            attacker.takeDamage(trapDamage, from: self)
            print("\(attacker.name) takes \(trapDamage.roundedDown) damage from the trap.")
        }
        healthPoints = max(0, healthPoints - amount)
        print("It deals \(amount.roundedDown) damage.")
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
        case .heal:
            let healAmount = self.attackPower * attack.powerMultiplier
            target.healthPoints = min(target.maxHealthPoints, target.healthPoints + healAmount)
            print("\(name) heals \(self == target ? "themselves" : target.name) for \(healAmount.roundedDown) HP.")
        case .manaRestore:
            let manaAmount = self.attackPower * attack.powerMultiplier
            target.manaPoints = min(target.maxManaPoints, target.manaPoints + manaAmount)
            print("\(name) restores \(manaAmount.roundedDown) MP to \(self == target ? "themselves" : target.name).")
        case .trap:
            target.hasTrap = true
            target.trapDamage = self.attackPower * attack.powerMultiplier
            print("\(name) sets a trap in front of \(self == target ? "themself" : target.name)!")
        case .buffAttack:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.attackPower += buffAmount
            print("\(name) boosts \(self == target ? "their own" : "\(target.name)'s") attack power by \(buffAmount.roundedDown).")
        case .buffDefense:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.defense += buffAmount
            print("\(name) boosts \(self == target ? "their own" : "\(target.name)'s") defense by \(buffAmount.roundedDown).")
        case .debuffAttack:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.attackPower = max(0, target.attackPower - buffAmount)
            print("\(name) weakens \(target.name)'s attack power by \(buffAmount.roundedDown).")
        case .debuffDefense:
            let buffAmount = self.attackPower * attack.powerMultiplier
            target.defense = max(0, target.defense - buffAmount)
            print("\(name) reduces \(target.name)'s defense by \(buffAmount.roundedDown).")
        case .ultimate:
            if !hasUsedUltimate {
                print("\(name) uses ultimate attack \(attack.name).")
                hasUsedUltimate = true
                let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
                            target.takeDamage(totalDamage, from: self)
            } else {
                print("\(name) tries to use ultimate attack again, but this attack can only be used once.")
            }
        default:
            return
        }
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name
    }
}
