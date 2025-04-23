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
    
    let wrathUnleashed: Attack = Attack(name: "Wrath Unleashed", powerMultiplier: 1.2, manaCost: 5, type: .areaDamage, infoText: "The henchman explodes in a storm of fury, unleashing wrath upon all who dared defy their master.")
    
    func takeRevenge() {
        attackPower += 15
        defense += 15
        attacks.append(wrathUnleashed)
        print("\(name) is fueled by revenge! Their power surges!")
    }
}
