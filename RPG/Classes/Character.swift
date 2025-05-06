//
//  Character.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation
import AVFAudio

class Character: CustomStringConvertible, Equatable {
    let name: String
    
    var maxHealthPoints: Double
    var healthPoints: Double {
        didSet {
            if healthPoints < oldValue {
                soundManager.playSound(path: damageSoundPath)
            }
        }
    }
    var maxManaPoints: Double
    var manaPoints: Double
    
    var attacks: [Attack]
    var buffs: [Buff] = []
    
    var attackPower: Double
    var defense: Double
    
    var hasTrap: Bool = false
    var trapDamage: Double = 0
    var hasUsedUltimate = false
    
    let soundManager = SoundManager()
    let damageSoundPath = SoundLibrary.owMale
    
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
        self.attackPower = max(0, self.attackPower + buff.attackPoints)
        self.defense = max(0, self.defense + buff.defensePoints)
        self.healthPoints = max(0, self.healthPoints + buff.healthPoints)
        self.maxHealthPoints = max(0, self.maxHealthPoints + buff.healthPoints)
        self.manaPoints = max(0, self.manaPoints + buff.manaPoints)
        self.maxManaPoints = max(0, self.maxManaPoints + buff.manaPoints)
        buffs.append(buff)
    }
    
    func removeBuff(_ oldBuff: Buff) {
        if let oldIndex = buffs.firstIndex(where: { $0.equalsBuff(oldBuff) }) {
            self.attackPower = max(0, self.attackPower - oldBuff.attackPoints)
            self.defense = max(0, self.defense - oldBuff.defensePoints)
            self.maxHealthPoints = max(0, self.maxHealthPoints - oldBuff.healthPoints)
            self.healthPoints = max(0, min(self.maxHealthPoints, self.healthPoints - oldBuff.healthPoints))
            self.maxManaPoints = max(0, self.maxManaPoints - oldBuff.manaPoints)
            self.manaPoints = max(0, min(self.maxManaPoints, self.manaPoints - oldBuff.manaPoints))
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
    
    func attack(_ attack: Attack, on target: Character?) {
        let actualTarget: Character = attack.isSelfTargeting ? self : (target ?? self)
        manaPoints -= attack.manaCost
        print("\n\(name) uses \(attack.name) on \(self == actualTarget ? "themself" : actualTarget.name).")
        
        switch attack.type {
        case .damage:
            let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - actualTarget.defense)
            actualTarget.takeDamage(totalDamage, from: self)
        case .heal:
            let healAmount = self.attackPower * attack.powerMultiplier
            actualTarget.healthPoints = min(actualTarget.maxHealthPoints, actualTarget.healthPoints + healAmount)
            print("\(name) heals \(self == actualTarget ? "themselves" : actualTarget.name) for \(healAmount.roundedUp) HP.")
        case .manaRestore:
            let manaAmount = self.attackPower * attack.powerMultiplier
            actualTarget.manaPoints = min(actualTarget.maxManaPoints, actualTarget.manaPoints + manaAmount)
            print("\(name) restores \(manaAmount.roundedUp) MP to \(self == actualTarget ? "themselves" : actualTarget.name).")
        case .trap:
            actualTarget.hasTrap = true
            actualTarget.trapDamage = self.attackPower * attack.powerMultiplier
            print("\(name) sets a trap in front of \(self == actualTarget ? "themself" : actualTarget.name)!")
        case .buffAttack:
            let buff = Buff(attackPoints: self.attackPower * attack.powerMultiplier, defensePoints: 0, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            actualTarget.applyBuff(buff)
            print("\(name) boosts \(self == actualTarget ? "their own" : "\(actualTarget.name)'s") attack power by \(buff.attackPoints.roundedUp).")
        case .buffDefense:
            let buff = Buff(attackPoints: 0, defensePoints: self.attackPower * attack.powerMultiplier, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            actualTarget.applyBuff(buff)
            print("\(name) boosts \(self == actualTarget ? "their own" : "\(actualTarget.name)'s") defense by \(buff.defensePoints.roundedUp).")
        case .debuffAttack:
            let buff = Buff(attackPoints: self.attackPower * attack.powerMultiplier * -1, defensePoints: 0, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            actualTarget.applyBuff(buff)
            print("\(name) weakens \(actualTarget.name)'s attack power by \((buff.attackPoints * -1).roundedDown).")
        case .debuffDefense:
            let buff = Buff(attackPoints: 0, defensePoints: self.attackPower * attack.powerMultiplier * -1, healthPoints: 0, manaPoints: 0, isFromAttack: true)
            actualTarget.applyBuff(buff)
            print("\(name) reduces \(actualTarget.name)'s defense by \((buff.defensePoints * -1).roundedDown).")
        case .ultimate:
            if !hasUsedUltimate {
                print("\(name) uses ultimate attack \(attack.name).")
                hasUsedUltimate = true
                let totalDamage = max(1, (self.attackPower * attack.powerMultiplier) - actualTarget.defense)
                actualTarget.takeDamage(totalDamage, from: self)
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
