//
//  BossLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

struct BossLibrary {
    static let bossFactories: [(Int, Int) -> Boss] = [
        { DarkKnight(level: $0, henchmanLevel: $1) },
        { FrostKing(level: $0, henchmanLevel: $1) },
        { InfernalDemon(level: $0, henchmanLevel: $1) },
        { StormDragon(level: $0, henchmanLevel: $1) }
    ]
    
    static func randomBoss(difficultyLevel: Int) -> Boss {
        let bossLevel: Int
        let henchmanLevel: Int
        switch difficultyLevel {
        case ...1:
            bossLevel = Int.random(in: 1...3)
            henchmanLevel = Int.random(in: 1...3)
        case 2:
            bossLevel = Int.random(in: 3...5)
            henchmanLevel = Int.random(in: 3...5)
        default:
            bossLevel = Int.random(in: 5...8)
            henchmanLevel = Int.random(in: 5...8)
        }
        return bossFactories.randomElement()!(bossLevel, henchmanLevel)
    }
}
