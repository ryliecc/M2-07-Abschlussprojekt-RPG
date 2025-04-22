//
//  Assassin.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Assassin: Hero {
    init() {
        super.init(name: "Assassin", initialHealthPoints: 20, healthPoints: 20, initialManaPoints: 10, manaPoints: 10, attackList: ["Death Mark", "Silence", "Quiet Death"])
    }
}
