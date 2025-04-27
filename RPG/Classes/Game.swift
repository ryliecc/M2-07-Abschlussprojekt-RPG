//
//  Game.swift
//  RPG
//
//  Created by Rylie Castell on 24.04.25.
//

import Foundation

class Game: BossDelegate {
    
    var party: [Hero] = []
    
    var hero1: Hero = Assassin()
    var hero2: Hero = Ranger()
    var hero3: Hero = Sorcerer()
    var hero4: Hero = Thief()
    
    var bag: Bag = Bag(items: [])
    
    static var boss1: Boss = DarkKnight()
    static var boss2: Boss = FrostKing()
    static var boss3: Boss = InfernalDemon()
    static var boss4: Boss = StormDragon()
    
    var undefeatedBosses: [Boss] = [boss1, boss2, boss3, boss4]
    
    var currentBoss: Boss {
        didSet {
            currentBoss.delegate = self
        }
    }
    var currentHenchman: Henchman? {
        return currentBoss.henchman
    }
    var currentOpponents: [Opponent] = []
    
    func generateStarterItems() {
        let randomNumber = Int.random(in: 5...7)
        var randomItems: [Item] = []
        
        for _ in 0..<randomNumber {
            let randomItem = ItemLibrary.randomItem()
            randomItems.append(randomItem)
        }
        bag.items = randomItems
    }
    
    func bossCalledHenchman() {
        currentOpponents.append(currentHenchman!)
        print("\(currentHenchman!.name) joined the fight.")
    }
    
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
        if !hero.isAlive {
            print("\(hero.name) is K.O. and cannot fight.")
            return
        }
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
        currentOpponents = currentOpponents.filter { $0.isAlive }
    }
    
    func fight() {
        print("\(currentBoss.name) appears. The fight begins!")
        currentOpponents = [currentBoss]
        var fightIsRunning: Bool = true
        var roundCounter: Int = 0
        while fightIsRunning {
            if checkIfBothSidesCanFight() {
                roundCounter += 1
                print("Round \(roundCounter)".highlight())
                party.shuffle()
                printAllStatusInfos()
                for hero in party {
                    printTurnMenu(hero)
                    if !checkIfBothSidesCanFight() {
                        fightIsRunning = false
                        break
                    }
                }
                for opponent in currentOpponents {
                    let availableTargets: [Hero] = party.filter { $0.isAlive }
                    let randomAttack = opponent.chooseRandomAttack()
                    switch randomAttack.type {
                    case .areaDamage:
                        opponent.attack(randomAttack, on: availableTargets)
                    case .damage, .debuffAttack, .debuffDefense, .ultimate:
                        opponent.attack(randomAttack, on: availableTargets.randomElement()!)
                    case .buffAttack, .buffDefense, .heal, .manaRestore:
                        opponent.attack(randomAttack, on: currentOpponents.randomElement()!)
                    case .trap:
                        opponent.attack(randomAttack, on: opponent)
                    }
                    if !checkIfBothSidesCanFight() {
                        fightIsRunning = false
                        break
                    }
                    currentOpponents = currentOpponents.filter { $0.isAlive }
                }
            } else {
                fightIsRunning = false
            }
        }
        party.contains(where: { $0.isAlive }) ? print("You won!") : print("You lost!")
    }
    
    func run() {
        generateStarterItems()
        party = [hero1, hero2, hero3, hero4]
        fight()
    }
    
    init() {
        self.currentBoss = undefeatedBosses.randomElement()!
    }
}
