//
//  Item.swift
//  RPG
//
//  Created by Rylie Castell on 23.04.25.
//

import Foundation

struct Item: CustomStringConvertible {
    let name: String
    
    let attackPoints: Double
    let defensePoints: Double
    let healthPoints: Double
    let manaPoints: Double
    
    var numberOfUsages: Int
    
    let isConsumable: Bool
    let isEquippable: Bool
    
    let infoText: String
    let actionText: String
    
    var description: String {
        "\(name)\(isEquippable ? " (lasts \(numberOfUsages) rounds)" : ""):\n\(infoText)"
    }
}
