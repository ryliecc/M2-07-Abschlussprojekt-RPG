//
//  Opponent.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Opponent: Character {
    
    func chooseRandomAttack() -> Attack {
        var availableAttacks: [Attack] = attacks.filter { $0.manaCost <= manaPoints }
        if !hasUsedUltimate {
            return availableAttacks.randomElement()!
        } else {
            availableAttacks = availableAttacks.filter { $0.type != .ultimate }
            return availableAttacks.randomElement()!
        }
    }
    
    func attack(_ attack: Attack, on targets: [Character]) {
        manaPoints -= attack.manaCost
        
        switch attack.type {
        case .areaDamage:
            print("\(name) uses \(attack.name).")
            for target in targets {
                let damage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
                print("\(attack.name) hits \(target.name).")
                target.takeDamage(damage, from: self)
            }
        case .heal:
            let target: Character = targets.randomElement()!
            let healAmount = self.attackPower * attack.powerMultiplier
            target.healthPoints = min(target.maxHealthPoints, target.healthPoints + healAmount)
            print("\(name) heals \(target.name) for \(healAmount.roundedUp) HP.")
        default:
            if let target = targets.randomElement() {
                let damage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
                print("\(name) hits \(target.name) with \(attack.name).")
                target.takeDamage(damage, from: self)
            }
        }
    }
}
