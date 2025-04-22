//
//  Ranger.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Ranger: Hero {
    let arrowShot: Attack = Attack(name: "Arrow Shot", powerMultiplier: 1.0, manaCost: 0, type: .damage)
    let rainOfThorns: Attack = Attack(name: "Rain of Thorns", powerMultiplier: 1.3, manaCost: 4, type: .damage)
    let eaglesEye: Attack = Attack(name: "Eagle's Eye", powerMultiplier: 0.6, manaCost: 3, type: .buffAttack)
    let forestVeil: Attack = Attack(name: "Forest Veil", powerMultiplier: 0.8, manaCost: 3, type: .buffDefense)
    init() {
        super.init(name: "Ranger", maxHealthPoints: 18, healthPoints: 18, maxManaPoints: 18, manaPoints: 18, attacks: [arrowShot, rainOfThorns, eaglesEye, forestVeil], attackPower: 9, defense: 6)
    }
}
