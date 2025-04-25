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
    
    func chooseAttack() -> Attack? {
        print("Choose an attack:")
        for (index, attack) in attacks.enumerated() {
            print("[\(index + 1)] \(attack.name)\n\(attack.infoText)")
        }
        print("[\(attacks.count + 1)] Go back")
        let chosenIndex: Int = enterInteger(min: 1, max: attacks.count + 1) - 1
        if chosenIndex == attacks.count {
            return nil
        }
        let chosenAttack: Attack = attacks[chosenIndex]
        return chosenAttack
    }
    
    func chooseTarget(possibleTargets: [Character]) -> Character? {
        print("Choose the target.")
        for (index, possibleTarget) in possibleTargets.enumerated() {
            print("[\(index + 1)] \(possibleTarget.name)")
        }
        print("[\(possibleTargets.count + 1)] Go back")
        let chosenIndex: Int = enterInteger(min: 1, max: possibleTargets.count + 1) - 1
        if chosenIndex == possibleTargets.count {
            return nil
        } else {
            return possibleTargets[chosenIndex]
        }
    }
    
    override init(name: String, maxHealthPoints: Double, maxManaPoints: Double, attacks: [Attack] = [], attackPower: Double, defense: Double) {
        super.init(name: name, maxHealthPoints: maxHealthPoints, maxManaPoints: maxManaPoints, attacks: attacks, attackPower: attackPower, defense: defense)
    }
}
