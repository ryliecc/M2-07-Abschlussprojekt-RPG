//
//  Hero.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Hero: Character {
    override init(name: String, maxHealthPoints: Double, healthPoints: Double, maxManaPoints: Double, manaPoints: Double, attacks: [Attack] = [], attackPower: Double, defense: Double) {
        super.init(name: name, maxHealthPoints: maxHealthPoints, healthPoints: healthPoints, maxManaPoints: maxManaPoints, manaPoints: manaPoints, attacks: attacks, attackPower: attackPower, defense: defense)
    }
}
