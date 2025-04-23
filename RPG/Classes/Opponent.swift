//
//  Opponent.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Opponent: Character {
    
    func attack(_ attack: Attack, on targets: [Character]) {
        guard manaPoints >= attack.manaCost else {
            print("\(name) tried to use \(attack.name), but didn't have enough mana. The attack failed.")
            return
        }
        
        manaPoints -= attack.manaCost
        
        switch attack.type {
        case .areaDamage:
            print("\(name) uses \(attack.name).")
            for target in targets {
                let damage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
                print("\(attack.name) hits \(target.name).")
                target.takeDamage(damage, from: self)
            }
        case .ultimate:
            if !hasUsedUltimate {
                hasUsedUltimate = true
                if let target = targets.randomElement() {
                    print("\(name) uses ultimate attack \(attack.name).")
                    let damage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
                    print("\(name) hits \(target.name) with \(attack.name).")
                    target.takeDamage(damage, from: self)
                }
            } else {
                print("\(name) tries to use ultimate attack again, but this attack can only be used once.")
            }
        case .heal:
            var target: Character
            repeat {
                target = targets.randomElement()!
            } while target == self
            let healAmount = self.attackPower * attack.powerMultiplier
            target.healthPoints = min(target.maxHealthPoints, target.healthPoints + healAmount)
            print("\(name) heals \(target.name) for \(healAmount.roundedDown) HP.")
        default:
            if let target = targets.randomElement() {
                let damage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
                print("\(name) hits \(target.name) with \(attack.name).")
                target.takeDamage(damage, from: self)
            }
        }
    }
}
