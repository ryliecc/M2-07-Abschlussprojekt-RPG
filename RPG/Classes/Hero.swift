//
//  Hero.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Hero: Character {
    let initialManaPoints: Double
    let manaPoints: Double
    
    init(name: String, initialHealthPoints: Double, healthPoints: Double, initialManaPoints: Double, manaPoints: Double, attackList: [String] = []) {
        self.initialManaPoints = initialManaPoints
        self.manaPoints = manaPoints
        super.init(name: name, initialHealthPoints: initialHealthPoints, healthPoints: healthPoints, attackList: attackList)
    }
}
