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
        let percentage = currentValue / maxValue
        
        let color: ConsoleStyle
        switch percentage {
        case ..<0.3: color = .red
        case ..<0.6: color = .yellow
        default: color = .green
        }
        
        let bothParts = (filledPart + emptyPart).applyConsoleStyles(color)
        return "\(self): \(bothParts) " + "\(Int(currentValue.roundedUp))/\(Int(maxValue.roundedUp))".applyConsoleStyles(.bold)
    }
    
    func highlight() -> String {
        return "\n~~~\(self)~~~"
    }
    
    func applyConsoleStyles(_ styles: ConsoleStyle...) -> String {
        let combined = styles.map { $0.rawValue }.joined()
        return "\(combined)\(self)\(ConsoleStyle.reset.rawValue)"
    }
    
    var visibleLength: Int {
        let pattern = #"\u001B\[[0-9;]*m"#
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return self.count
        }
        let range = NSRange(startIndex..., in: self)
        return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "").count
    }
    
    func frame(padding: Int) -> String {
        let content = String(repeating: " ", count: padding) + self + String(repeating: " ", count: padding)
        let visibleWidth = content.visibleLength
        let top = "╔" + String(repeating: "═", count: visibleWidth) + "╗"
        let middle = "║" + content + "║"
        let bottom = "╚" + String(repeating: "═", count: visibleWidth) + "╝"
        return [top, middle, bottom].joined(separator: "\n")
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
