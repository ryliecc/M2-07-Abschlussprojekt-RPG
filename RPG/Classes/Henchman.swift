//
//  Henchman.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Henchman: Opponent {
    var isFueledByRevenge: Bool = false {
        didSet {
            if isFueledByRevenge && oldValue == false {
                takeRevenge()
            }
        }
    }
    
    let revengeAttack: Attack
    
    func takeRevenge() {
        attackPower += 15
        defense += 15
        attacks.append(revengeAttack)
        print("\(name) is fueled by revenge! Their power surges!")
    }
    
    init(name: String, maxHealthPoints: Double, maxManaPoints: Double, standardAttacks: [Attack], attackPower: Double, defense: Double, level: Int, healthMultiplier: Double, manaMultiplier: Double, attackMultiplier: Double, defenseMultiplier: Double, revengeAttack: Attack) {
        self.revengeAttack = revengeAttack
        super.init(name: name, maxHealthPoints: maxHealthPoints, maxManaPoints: maxManaPoints, attacks: standardAttacks, attackPower: attackPower, defense: defense, level: level, healthMultiplier: healthMultiplier, manaMultiplier: manaMultiplier, attackMultiplier: attackMultiplier, defenseMultiplier: defenseMultiplier)
    }
}
