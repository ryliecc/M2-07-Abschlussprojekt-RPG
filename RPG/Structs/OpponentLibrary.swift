//
//  OpponentLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

struct OpponentLibrary {
    static let opponentFactories: [() -> Opponent] = [
        { GoblinScout() },
        { ForestWolf() },
        { Bandit() },
        { CaveSpider() },
        { SkeletalMinion() }
    ]
    
    static func randomOpponent() -> Opponent {
        return opponentFactories.randomElement()!()
    }
}
