//
//  Boss.swift
//  RPG
//
//  Created by Rylie Castell on 23.04.25.
//

import Foundation

class Boss: Opponent {
    override var healthPoints: Double {
        didSet {
            if healthPoints <= maxHealthPoints / 2 && oldValue > maxHealthPoints / 2 && henchman == nil {
                henchman = callHenchman()
            }
            if healthPoints == 0 && oldValue > 0 {
                henchman?.isFueledByRevenge = true
            }
        }
    }
    
    var henchman: Henchman?
    
    func callHenchman() -> Henchman {
        return Henchman(name: "Henchman", maxHealthPoints: 10, healthPoints: 10, maxManaPoints: 5, manaPoints: 5, attackPower: 5, defense: 4)
    }
}
