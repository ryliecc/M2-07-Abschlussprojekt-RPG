//
//  Extensions.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

extension Double {
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
