//
//  Opponent.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Opponent: Character {
    
    weak var opponentDelegate: OpponentDelegate?
    
    override func takeDamage(_ amount: Double, from attacker: Character) {
        if hasTrap {
            hasTrap = false
            print("\(name)'s trap is triggered and hurts \(attacker.name).")
            attacker.takeDamage(trapDamage, from: self)
        } else {
            print("It deals \(amount.roundedUp) damage.")
            if healthPoints - amount <= 0 {
                print("\(name) died and cannot keep fighting.")
                opponentDelegate?.handleOpponentDeath(self)
            }
            healthPoints = max(0, healthPoints - amount)
        }
    }
    
    func chooseRandomAttack() -> Attack {
        var availableAttacks: [Attack] = attacks.filter { $0.manaCost <= manaPoints }
        if !hasUsedUltimate {
            return availableAttacks.randomElement()!
        } else {
            availableAttacks = availableAttacks.filter { $0.type != .ultimate }
            return availableAttacks.randomElement()!
        }
    }
}
