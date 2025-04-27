//
//  BossLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

struct BossLibrary {
    static let bossFactories: [() -> Boss] = [
        { DarkKnight() },
        { FrostKing() },
        { InfernalDemon() },
        { StormDragon() }
    ]
    
    static func randomBoss() -> Boss {
        return bossFactories.randomElement()!()
    }
}
