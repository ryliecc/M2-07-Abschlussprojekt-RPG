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
    var numberOfUsages: Int
    let infoText: String
    let isConsumable: Bool
    let isEquippable: Bool
    
    var description: String {
        "\(numberOfUsages)x \(name): \(infoText)"
    }
}
