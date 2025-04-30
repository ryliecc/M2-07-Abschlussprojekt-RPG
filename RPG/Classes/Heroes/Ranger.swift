//
//  Ranger.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Ranger: Hero {
    let arrowShot: Attack = Attack(name: "Arrow Shot", powerMultiplier: 1.1, manaCost: 0, type: .damage, infoText: "A swift shot that strikes with deadly accuracy from a distance.")
    let rainOfThorns: Attack = Attack(name: "Rain of Thorns", powerMultiplier: 1.4, manaCost: 4, type: .damage, infoText: "A flurry of arrows that rain down, damaging all enemies in range.")
    let eaglesEye: Attack = Attack(name: "Eagle's Eye", powerMultiplier: 0.8, manaCost: 3, type: .buffAttack, infoText: "A steady focus that sharpens the ranger's aim, increasing attack power for the next few shots.")
    let forestVeil: Attack = Attack(name: "Forest Veil", powerMultiplier: 0.8, manaCost: 3, type: .buffDefense, infoText: "The ranger calls upon nature to protect them, boosting their defense for a while.")
    
    init() {
        super.init(name: "Ranger", maxHealthPoints: 20, maxManaPoints: 18, attacks: [arrowShot, rainOfThorns, eaglesEye, forestVeil], attackPower: 9, defense: 8)
    }
    
    override func levelUp() {
        super.levelUp()
        defense += 3
        maxHealthPoints += 2
        healthPoints = maxHealthPoints
    }
}
