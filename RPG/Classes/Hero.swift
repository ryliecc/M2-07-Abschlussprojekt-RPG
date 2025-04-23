//
//  Hero.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Hero: Character, Levelable {
    var experiencePoints: Int = 0
    
    var level: Int = 1
    
    var experienceNeededForNextLevel: Int {
        level * 100
    }
    
    func gainExperience(_ amount: Int) {
        experiencePoints += amount
        while experiencePoints >= experienceNeededForNextLevel {
            experiencePoints -= experienceNeededForNextLevel
            levelUp()
        }
    }
    
    func levelUp() {
        level += 1
        print("\(name) hase leveled up to level \(level)!")
        attackPower += 5
        defense += 3
        maxHealthPoints += 10
        healthPoints = maxHealthPoints
        maxManaPoints += 5
        manaPoints = maxManaPoints
    }
    
    override init(name: String, maxHealthPoints: Double, maxManaPoints: Double, attacks: [Attack] = [], attackPower: Double, defense: Double) {
        super.init(name: name, maxHealthPoints: maxHealthPoints, maxManaPoints: maxManaPoints, attacks: attacks, attackPower: attackPower, defense: defense)
    }
}
