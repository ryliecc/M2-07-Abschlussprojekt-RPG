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
            if self.isAlive && healthPoints <= maxHealthPoints / 2 && oldValue > maxHealthPoints / 2 && henchman == nil {
                callHenchman()
            }
            if healthPoints == 0 && oldValue > 0 && henchman != nil && henchman!.isAlive {
                henchman!.isFueledByRevenge = true
            }
        }
    }
    
    var henchman: Henchman?
    let dedicatedHenchman: Henchman
    
    weak var bossDelegate: BossDelegate?
    
    func callHenchman() {
        print("\(name) summons help. \(dedicatedHenchman.name) appears.")
        henchman = dedicatedHenchman
        henchman?.opponentDelegate = self.opponentDelegate
        bossDelegate?.bossCalledHenchman()
    }
    
    init(name: String, maxHealthPoints: Double, maxManaPoints: Double, attacks: [Attack], attackPower: Double, defense: Double, tempo: Double, level: Int, healthMultiplier: Double, manaMultiplier: Double, attackMultiplier: Double, defenseMultiplier: Double, tempoMultiplier: Double, dedicatedHenchman: Henchman) {
        self.dedicatedHenchman = dedicatedHenchman
        super.init(name: name, maxHealthPoints: maxHealthPoints, maxManaPoints: maxManaPoints, attacks: attacks, attackPower: attackPower, defense: defense, tempo: tempo, level: level, healthMultiplier: healthMultiplier, manaMultiplier: manaMultiplier, attackMultiplier: attackMultiplier, defenseMultiplier: defenseMultiplier, tempoMultiplier: tempoMultiplier)
    }
}
