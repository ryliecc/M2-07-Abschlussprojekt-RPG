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
    
    static func randomOpponents() -> [Opponent] {
        let amountOfOpponents = Int.random(in: 1...3)
        var opponents: [Opponent] = []
        let opponentFactory = opponentFactories.randomElement()!
        for _ in 0..<amountOfOpponents {
            opponents.append(opponentFactory())
        }
        return opponents
    }
}
