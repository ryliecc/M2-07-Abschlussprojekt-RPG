//
//  Ranger.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

class Ranger: Hero {
    init() {
        super.init(name: "Ranger", initialHealthPoints: 18, healthPoints: 18, initialManaPoints: 18, manaPoints: 18, attackList: ["Arrow Shot", "Multi Shot", "Camouflage"])
    }
}
