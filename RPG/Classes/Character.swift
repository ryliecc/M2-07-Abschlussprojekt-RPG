//
//  Character.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Character: CustomStringConvertible {
    let name: String
    let initialHealthPoints: Double
    var healthPoints: Double
    var attackList: [String]
    
    init(name: String, initialHealthPoints: Double, healthPoints: Double, attackList: [String] = []) {
        self.name = name
        self.initialHealthPoints = initialHealthPoints
        self.healthPoints = healthPoints
        self.attackList = attackList
    }
    
    var description: String {
        "\(name)\nHP: \(healthPoints)/\(initialHealthPoints)"
    }
}
