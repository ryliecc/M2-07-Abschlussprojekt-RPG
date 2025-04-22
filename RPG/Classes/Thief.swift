//
//  Thief.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Thief: Hero {
    init() {
        super.init(name: "Thief", initialHealthPoints: 20, healthPoints: 20, initialManaPoints: 12, manaPoints: 12, attackList: ["Backstab", "Poison Dagger", "Trap"])
    }
}
