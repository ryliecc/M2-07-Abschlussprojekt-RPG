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
    let dedicatedHenchman: Henchman = Henchman(name: "Henchman", maxHealthPoints: 10, maxManaPoints: 5, attacks: [Attack(name: "Henchman attack", powerMultiplier: 1.2, manaCost: 0, type: .damage, infoText: "A henchman attack"), Attack(name: "Strong Henchman Attack", powerMultiplier: 1.6, manaCost: 2, type: .damage, infoText: "A strong henchman attack")], attackPower: 5, defense: 4)
    
    weak var delegate: BossDelegate?
    
    func callHenchman() {
        print("\(name) summons help. \(dedicatedHenchman.name) appears.")
        henchman = dedicatedHenchman
        delegate?.bossCalledHenchman()
    }
}
