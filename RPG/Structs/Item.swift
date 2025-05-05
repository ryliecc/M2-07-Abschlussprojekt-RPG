//
//  Item.swift
//  RPG
//
//  Created by Rylie Castell on 23.04.25.
//

import Foundation

struct Item: CustomStringConvertible {
    let name: String
    var styledName: String {
        name.applyConsoleStyles(.blue, .bold)
    }
    
    let attackPoints: Double
    let defensePoints: Double
    let healthPoints: Double
    let manaPoints: Double
    
    var numberOfUsages: Int
    
    let isConsumable: Bool
    var isEquippable: Bool {
        !isConsumable
    }
    let isRare: Bool
    
    let infoText: String
    let actionText: String
    
    var description: String {
        "\(styledName)\(isEquippable ? " (lasts \(numberOfUsages) rounds)" : ""):\n\(infoText.applyConsoleStyles(.italic))"
    }
}
