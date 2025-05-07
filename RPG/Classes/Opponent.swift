//
//  Opponent.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Opponent: Character {
    
    let level: Int
    
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
    
    init(name: String, maxHealthPoints: Double, maxManaPoints: Double, attacks: [Attack], attackPower: Double, defense: Double, tempo: Double, level: Int, opponentDelegate: OpponentDelegate? = nil, healthMultiplier: Double, manaMultiplier: Double, attackMultiplier: Double, defenseMultiplier: Double, tempoMultiplier: Double) {
        self.level = level
        self.opponentDelegate = opponentDelegate
        let leveledHealthPoints = maxHealthPoints + (Double(level - 1) * healthMultiplier)
        let leveledManaPoints = maxManaPoints + (Double(level - 1) * manaMultiplier)
        let leveledAttackPower = attackPower + (Double(level - 1) * attackMultiplier)
        let leveledDefense = defense + (Double(level - 1) * defenseMultiplier)
        let leveledTempo = tempo + (Double(level - 1) * tempoMultiplier)
        super.init(name: name, maxHealthPoints: leveledHealthPoints, maxManaPoints: leveledManaPoints, attacks: attacks, attackPower: leveledAttackPower, defense: leveledDefense, tempo: leveledTempo)
    }
}
