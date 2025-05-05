//
//  Character.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Character: CustomStringConvertible, Equatable {
    let name: String
    
    var maxHealthPoints: Double
    var healthPoints: Double
    var maxManaPoints: Double
    var manaPoints: Double
    
    var attacks: [Attack]
    var buffs: [Buff] = []
    
    var attackPower: Double
    var defense: Double
    
    var hasTrap: Bool = false
    var trapDamage: Double = 0
    var hasUsedUltimate = false
    
    init(name: String, maxHealthPoints: Double, maxManaPoints: Double, attacks: [Attack], attackPower: Double, defense: Double) {
        self.name = name
        self.maxHealthPoints = maxHealthPoints
        self.healthPoints = maxHealthPoints
        self.maxManaPoints = maxManaPoints
        self.manaPoints = maxManaPoints
        self.attacks = attacks
        self.attackPower = attackPower
        self.defense = defense
    }
    
    var description: String {
        let healthPointsBar = "HP".progressBar(for: healthPoints, maxValue: maxHealthPoints)
        let manaPointsBar = "MP".progressBar(for: manaPoints, maxValue: maxManaPoints)
        return "\(name.applyConsoleStyles(.bold))\n\(healthPointsBar)\n\(manaPointsBar)"
    }
    
    func healAfterFight() {
        for buff in buffs {
            if buff.isFromAttack {
                removeBuff(buff)
            }
        }
        hasTrap = false
        trapDamage = 0
        hasUsedUltimate = false
    }
    
    func healOverNight() {
        self.healthPoints = self.maxHealthPoints
        self.manaPoints = self.maxManaPoints
    }
    
    func applyBuff(_ buff: Buff) {
        self.attackPower += buff.attackPoints
        self.defense += buff.defensePoints
        self.healthPoints += buff.healthPoints
        self.maxHealthPoints += buff.healthPoints
        self.manaPoints += buff.manaPoints
        self.maxManaPoints += buff.manaPoints
        buffs.append(buff)
    }
    
    func removeBuff(_ oldBuff: Buff) {
        if let oldIndex = buffs.firstIndex(where: { $0.equalsBuff(oldBuff) }) {
            self.attackPower -= oldBuff.attackPoints
            self.defense -= oldBuff.defensePoints
            self.maxHealthPoints -= oldBuff.healthPoints
            self.healthPoints -= oldBuff.healthPoints
            self.maxManaPoints -= oldBuff.manaPoints
            self.manaPoints -= oldBuff.manaPoints
            buffs.remove(at: oldIndex)
        }
    }
    
    func takeDamage(_ amount: Double, from attacker: Character) {
        if hasTrap {
            hasTrap = false
            print("\(name)'s trap is triggered and hurts \(attacker.name).")
            attacker.takeDamage(trapDamage, from: self)
        } else {
            print("It deals \(amount.roundedUp) damage.")
            if healthPoints - amount <= 0 {
                print("\(name) died and cannot keep fighting.")
            }
            healthPoints = max(0, healthPoints - amount)
        }
    }
    
    func attack(_ attack: Attack, on target: Character) {
        manaPoints -= attack.manaCost
        print("\(name) uses \(attack.name) on \(self == target ? "themself" : target.name).")
        
        switch attack.type {
        case .damage:
            let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
            target.takeDamage(totalDamage, from: self)
        case .heal:
            let healAmount = self.attackPower * attack.powerMultiplier
            target.healthPoints = min(target.maxHealthPoints, target.healthPoints + healAmount)
            print("\(name) heals \(self == target ? "themselves" : target.name) for \(healAmount.roundedUp) HP.")
        case .manaRestore:
            let manaAmount = self.attackPower * attack.powerMultiplier
            target.manaPoints = min(target.maxManaPoints, target.manaPoints + manaAmount)
            print("\(name) restores \(manaAmount.roundedUp) MP to \(self == target ? "themselves" : target.name).")
        case .trap:
            target.hasTrap = true
            target.trapDamage = self.attackPower * attack.powerMultiplier
            print("\(name) sets a trap in front of \(self == target ? "themself" : target.name)!")
        case .buffAttack:
            let buff = Buff(attackPoints: self.attackPower * attack.powerMultiplier, defensePoints: 0, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            target.applyBuff(buff)
            print("\(name) boosts \(self == target ? "their own" : "\(target.name)'s") attack power by \(buff.attackPoints.roundedUp).")
        case .buffDefense:
            let buff = Buff(attackPoints: 0, defensePoints: self.attackPower * attack.powerMultiplier, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            target.applyBuff(buff)
            print("\(name) boosts \(self == target ? "their own" : "\(target.name)'s") defense by \(buff.defensePoints.roundedUp).")
        case .debuffAttack:
            let buff = Buff(attackPoints: self.attackPower * attack.powerMultiplier * -1, defensePoints: 0, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            target.applyBuff(buff)
            print("\(name) weakens \(target.name)'s attack power by \((buff.attackPoints * -1).roundedDown).")
        case .debuffDefense:
            let buff = Buff(attackPoints: 0, defensePoints: self.attackPower * attack.powerMultiplier * -1, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            target.applyBuff(buff)
            print("\(name) reduces \(target.name)'s defense by \((buff.defensePoints * -1).roundedDown).")
        case .ultimate:
            if !hasUsedUltimate {
                print("\(name) uses ultimate attack \(attack.name).")
                hasUsedUltimate = true
                let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - target.defense)
                target.takeDamage(totalDamage, from: self)
            } else {
                print("\(name) tries to use ultimate attack again, but this attack can only be used once.")
            }
        default:
            return
        }
    }
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name
    }
}
