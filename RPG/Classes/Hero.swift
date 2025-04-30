//
//  Hero.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Hero: Character, Levelable {
    
    let classDescription: String
    
    var experiencePoints: Int = 0
    var level: Int = 1
    var experienceNeededForNextLevel: Int {
        level * 50
    }
    
    var equippedItem: Item? {
        didSet {
            if let newItem = equippedItem {
                applyItemEffects(newItem)
            }
            if let oldItem = oldValue {
                removeItemEffects(oldItem)
            }
        }
    }
    var equippedRoundCounter: Int = 0
    
    private func applyItemEffects(_ newItem: Item) {
        equippedRoundCounter = newItem.numberOfUsages
        let buff = Buff(attackPoints: newItem.attackPoints, defensePoints: newItem.defensePoints, healthPoints: newItem.healthPoints, manaPoints: newItem.manaPoints, isFromAttack: false)
        applyBuff(buff)
    }
    
    private func removeItemEffects(_ oldItem: Item) {
        if let oldBuff = buffs.first(where: { $0.equalsItem(oldItem) }) {
            removeBuff(oldBuff)
        }
    }
    
    
    func gainExperience(_ amount: Int) {
        experiencePoints += amount
        print("\(name) gained \(amount) XP!")
        while experiencePoints >= experienceNeededForNextLevel {
            experiencePoints -= experienceNeededForNextLevel
            levelUp()
        }
    }
    
    func levelUp() {
        level += 1
        print("\(name) hase leveled up to Lvl. \(level)!")
        
        let healthBoost = 8 + Double(level) * 2
        let manaBoost = 4 + Double(level) * 1.5
        let attackBoost = 3 + Double(level) * 1.2
        let defenseBoost = 2 + Double(level)
        
        attackPower += attackBoost
        defense += defenseBoost
        maxHealthPoints += healthBoost
        healthPoints = maxHealthPoints
        maxManaPoints += manaBoost
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
        if chosenAttack.manaCost > manaPoints {
            print("\(name) does not have enough MP to perform \(chosenAttack.name)!")
            return chooseAttack()
        } else {
            return chosenAttack
        }
    }
    
    func chooseTarget(possibleTargets: [Hero]) -> Hero? {
        print("Choose a hero.")
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
    
    func chooseTarget(possibleTargets: [Opponent]) -> Opponent? {
        print("Choose an opponent.")
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
    
    func useItem(_ item: Item) {
        if item.isConsumable {
            print("\(name) consumes \(item.name).")
            print(item.actionText)
            attackPower += item.attackPoints
            defense += item.defensePoints
            if healthPoints < maxHealthPoints && healthPoints + item.healthPoints >= maxHealthPoints {
                print("HP of \(name) fully restored!")
            }
            healthPoints = min(maxHealthPoints, healthPoints + item.healthPoints)
            if manaPoints < maxManaPoints && manaPoints + item.manaPoints >= maxManaPoints {
                print("MP of \(name) fully restored!")
            }
            manaPoints = min(maxManaPoints, manaPoints + item.manaPoints)
        }
        if item.isEquippable {
            print("\(name) equips \(item.name).")
            print(item.actionText)
            equippedItem = item
        }
    }
    
    init(name: String, maxHealthPoints: Double, maxManaPoints: Double, attacks: [Attack], attackPower: Double, defense: Double, classDescription: String) {
        self.classDescription = classDescription
        super.init(name: name, maxHealthPoints: maxHealthPoints, maxManaPoints: maxManaPoints, attacks: attacks, attackPower: attackPower, defense: defense)
    }
}
