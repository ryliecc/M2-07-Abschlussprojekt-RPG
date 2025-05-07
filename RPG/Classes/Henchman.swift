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
        attackPower += 5
        defense += 5
        tempo += 0.5
        attacks.append(revengeAttack)
        print("\(name) is fueled by revenge! Their power surges!")
    }
    
    init(name: String, maxHealthPoints: Double, maxManaPoints: Double, standardAttacks: [Attack], attackPower: Double, defense: Double, tempo: Double, level: Int, healthMultiplier: Double, manaMultiplier: Double, attackMultiplier: Double, defenseMultiplier: Double, tempoMultiplier: Double, revengeAttack: Attack) {
        self.revengeAttack = revengeAttack
        super.init(name: name, maxHealthPoints: maxHealthPoints, maxManaPoints: maxManaPoints, attacks: standardAttacks, attackPower: attackPower, defense: defense, tempo: tempo, level: level, healthMultiplier: healthMultiplier, manaMultiplier: manaMultiplier, attackMultiplier: attackMultiplier, defenseMultiplier: defenseMultiplier, tempoMultiplier: tempoMultiplier)
    }
}
