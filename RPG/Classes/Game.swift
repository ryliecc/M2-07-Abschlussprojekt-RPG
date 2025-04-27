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
    
    func printTurnMenu(_ hero: Hero) {
        print("It is \(hero.name)'s turn. What should they do?\n[1] Attack\n[2] Use Item")
        let choice: Int = enterInteger(min: 1, max: 2)
        if choice == 1 {
            let chosenAttack: Attack? = hero.chooseAttack()
            if chosenAttack == nil {
                printTurnMenu(hero)
            } else {
                switch chosenAttack!.type {
                case .damage, .debuffAttack, .debuffDefense, .ultimate, .areaDamage:
                    if currentOpponents.count > 1 {
                        let chosenOpponent: Character? = hero.chooseTarget(possibleTargets: currentOpponents)
                        chosenOpponent == nil ? printTurnMenu(hero) : hero.attack(chosenAttack!, on: chosenOpponent!)
                    } else {
                        hero.attack(chosenAttack!, on: currentOpponents[0])
                    }
                case .buffAttack, .buffDefense, .heal, .manaRestore, .trap:
                    let chosenHero: Character? = hero.chooseTarget(possibleTargets: party)
                    chosenHero == nil ? printTurnMenu(hero) : hero.attack(chosenAttack!, on: chosenHero!)
                }
            }
        }
        if choice == 2 {
            let item: Item? = bag.menu(hero)
            if item == nil {
                printTurnMenu(hero)
            } else {
                let itemIndex = bag.items.firstIndex(where: { $0.name == item!.name })!
                bag.items.remove(at: itemIndex)
                hero.useItem(item!)
            }
        }
        if hero.equippedItem != nil {
            hero.equippedRoundCounter -= 1
            if hero.equippedRoundCounter < 0 {
                print("\(hero.equippedItem!.name) is used up. The temporary effects have ended.")
                hero.equippedItem = nil
            }
        }
    }
    
    func fight() {
        print("\(currentOpponents[0].name) appears. The fight begins!")
        fightIsRunning = true
        var roundCounter: Int = 0
        while fightIsRunning {
            if checkIfBothSidesCanFight() {
                roundCounter += 1
                print("Round \(roundCounter)".highlight())
                printAllStatusInfos()
                party.shuffle()
                for hero in party {
                    printTurnMenu(hero)
                    guard checkIfBothSidesCanFight() else {
                        fightIsRunning = false
                        return
                    }
                }
                for opponent in currentOpponents {
                    print("\(opponent.name) will soon attack here.")
                    // let opponents attack
                    guard checkIfBothSidesCanFight() else {
                        fightIsRunning = false
                        return
                    }
                }
            } else {
                fightIsRunning = false
            }
        }
        party.contains(where: { $0.isAlive }) ? print("You won!") : print("You lost!")
    }
    
    func run() {}
    
    init() {}
}
