//
//  Game.swift
//  RPG
//
//  Created by Rylie Castell on 24.04.25.
//

import Foundation

class Game {
    
    var party: [Hero] = []
    
    var hero1: Hero = Assassin()
    var hero2: Hero = Ranger()
    var hero3: Hero = Sorcerer()
    var hero4: Hero = Thief()
    
    var bag: Bag = Bag(items: [])
    
    var currentOpponents: [Opponent] = []
    
    var fightIsRunning: Bool = false
    
    func checkIfBothSidesCanFight() -> Bool {
        if party.contains(where: { $0.isAlive }) && currentOpponents.contains(where: { $0.isAlive }) {
            return true
        } else {
            return false
        }
    }
    
    func printAllStatusInfos() {
        party.forEach {
            print($0)
        }
        currentOpponents.forEach {
            print($0)
        }
    }
    
    func fight(opponent: Opponent) {
        print("\(opponent.name) appears. The fight begins!")
        fightIsRunning = true
        var roundCounter: Int = 0
        while fightIsRunning {
            if checkIfBothSidesCanFight() {
                roundCounter += 1
                print("Round \(roundCounter)".highlight())
                printAllStatusInfos()
                party.shuffle()
            } else {
                fightIsRunning = false
            }
        }
        party.contains(where: { $0.isAlive }) ? print("You won!") : print("You lost!")
    }
    
    func run() {}
    
    init() {}
}
