//
//  OpponentLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

struct OpponentLibrary {
    static let opponentFactories: [(Int) -> Opponent] = [
        { GoblinScout(level: $0) },
        { ForestWolf(level: $0) },
        { Bandit(level: $0) },
        { CaveSpider(level: $0) },
        { SkeletalMinion(level: $0) }
    ]
    
    static func randomOpponent(difficultyLevel: Int) -> Opponent {
        let opponentLevel: Int
        switch difficultyLevel {
        case ...1: opponentLevel = Int.random(in: 1...3)
        case 2: opponentLevel = Int.random(in: 3...5)
        default: opponentLevel = Int.random(in: 5...8)
        }
        return opponentFactories.randomElement()!(opponentLevel)
    }
    
    static func randomOpponents(amount: Int, difficultyLevel: Int) -> [Opponent] {
        var opponents: [Opponent] = []
        let opponentFactory = opponentFactories.randomElement()!
        for _ in 0..<amount {
            let opponentLevel: Int
            switch difficultyLevel {
            case ...1: opponentLevel = Int.random(in: 1...3)
            case 2: opponentLevel = Int.random(in: 3...5)
            default: opponentLevel = Int.random(in: 5...8)
            }
            opponents.append(opponentFactory(opponentLevel))
        }
        return opponents
    }
}
