//
//  Ranger.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Ranger: Hero {
    let arrowShot: Attack = Attack(name: "Arrow Shot", powerMultiplier: 1.0, manaCost: 0, type: .damage, infoText: "A precise arrow fired with deadly accuracy.")
    let rainOfThorns: Attack = Attack(name: "Rain of Thorns", powerMultiplier: 1.3, manaCost: 4, type: .damage, infoText: "A flurry of sharp arrows rains down upon the enemy.")
    let eaglesEye: Attack = Attack(name: "Eagle's Eye", powerMultiplier: 0.6, manaCost: 3, type: .buffAttack, infoText: "Focuses the ranger's aim, empowering the next strikes.")
    let forestVeil: Attack = Attack(name: "Forest Veil", powerMultiplier: 0.8, manaCost: 3, type: .buffDefense, infoText: "The ranger draws on nature’s protection to harden their defenses.")
    init() {
        super.init(name: "Ranger", maxHealthPoints: 18, healthPoints: 18, maxManaPoints: 18, manaPoints: 18, attacks: [arrowShot, rainOfThorns, eaglesEye, forestVeil], attackPower: 9, defense: 6)
    }
}
