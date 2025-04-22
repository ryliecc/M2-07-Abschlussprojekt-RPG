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
    
    init(name: String, initialHealthPoints: Double, healthPoints: Double) {
        self.name = name
        self.initialHealthPoints = initialHealthPoints
        self.healthPoints = healthPoints
    }
    
    var description: String {
        "\(name)\nHP: \(healthPoints)/\(initialHealthPoints)"
    }
}
