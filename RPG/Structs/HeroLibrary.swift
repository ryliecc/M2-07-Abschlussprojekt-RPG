//
//  HeroLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

struct HeroLibrary {
    static let heroFactories: [() -> Hero] = [
        { Assassin() },
        { Beastmaster() },
        { Berserker() },
        { Druid() },
        { Monk() },
        { Paladin() },
        { Pyromancer() },
        { Ranger() },
        { Ronin() },
        { Sorcerer() },
        { Thief() }
    ]
}
