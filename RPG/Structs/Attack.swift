//
//  Attack.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

struct Attack: CustomStringConvertible {
    let name: String
    let powerMultiplier: Double
    let manaCost: Double
    let type: AttackType
    let infoText: String
    let isSelfTargeting: Bool
    
    var description: String {
        "\(name):\n\(infoText)\nMP Cost: \(manaCost)"
    }
}
