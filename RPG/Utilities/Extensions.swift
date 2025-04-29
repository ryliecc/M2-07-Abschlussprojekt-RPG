//
//  Extensions.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

extension Double {
    var roundedUp: Int {
        Int(ceil(self))
    }
    
    var roundedDown: Int {
        Int(floor(self))
    }
}

extension String {
    func progressBar(for currentValue: Double, maxValue: Double, barLength: Int = 20) -> String {
        let filledLength = Int((currentValue / maxValue) * Double(barLength))
        let emptyLength = barLength - filledLength
        let filledPart = String(repeating: "█", count: filledLength)
        let emptyPart = String(repeating: "▒", count: emptyLength)
        return "\(self): \(filledPart)\(emptyPart) \(Int(currentValue))/\(Int(maxValue))"
    }
    
    func highlight() -> String {
        return "~~~\(self)~~~"
    }
}

extension Character {
    var isAlive: Bool {
        healthPoints > 0
    }
}

extension Buff {
    func equalsItem(_ item: Item) -> Bool {
        return !self.isFromAttack && self.attackPoints == item.attackPoints && self.defensePoints == item.defensePoints && self.healthPoints == item.healthPoints && self.manaPoints == item.manaPoints
    }
    
    func equalsBuff(_ buff: Buff) -> Bool {
        return self.isFromAttack == buff.isFromAttack && self.attackPoints == buff.attackPoints && self.defensePoints == buff.defensePoints && self.healthPoints == buff.healthPoints && self.defensePoints == buff.defensePoints
    }
}
