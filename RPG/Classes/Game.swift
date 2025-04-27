//
//  Game.swift
//  RPG
//
//  Created by Rylie Castell on 24.04.25.
//

import Foundation

class Game: BossDelegate {
    
    var party: [Hero] = []
    var coins: Int = 0
    
    var hero1: Hero = Assassin()
    var hero2: Hero = Ranger()
    var hero3: Hero = Sorcerer()
    var hero4: Hero = Thief()
    
    var bag: Bag = Bag(items: [])
    
    var currentBoss: Boss = BossLibrary.randomBoss() {
        didSet {
            currentBoss.delegate = self
        }
    }
    var currentHenchman: Henchman? {
        return currentBoss.henchman
    }
    var currentOpponents: [Opponent] = []
    
    var currentTime: TimeOfDay = .day {
        didSet {
            if currentTime == .night {
                generateCheckpoints()
            }
            if currentTime == .day {
                //generateTavern()
            }
        }
    }
    var nextCheckpoints: [Checkpoint] = []
    
    func generateCheckpoints() {
        let numberOfCheckpoints = Int.random(in: 3...5)
        var checkpoints: [Checkpoint] = []
        for _ in 0..<numberOfCheckpoints - 1 {
            checkpoints.append(Checkpoint.generateRandomCheckpoint())
        }
        if !checkpoints.contains(where: { $0.type == .bossBattle }) {
            let randomBossBattleCheckpoint: Checkpoint = Checkpoint(type: .bossBattle, details: .bossBattle(boss: BossLibrary.randomBoss()))
        } else {
            checkpoints.append(Checkpoint.generateRandomCheckpoint())
        }
    }
    
    func openTreasureBox(type: TreasureType, items: [Item], coins: Int) {
        print("You found a treasure box. Let's see what's in there...")
        switch type {
        case .item:
            for item in items {
                print("You found \(item.name).")
                bag.items.append(item)
                print("\(item.name) was added to your bag.")
            }
        case .coins:
            print("You found \(coins) gold coins!")
            self.coins += coins
        }
    }
    
    func travel() {
        for checkpoint in nextCheckpoints {
            switch checkpoint.details {
            case .battle(let opponent):
                prepareRegularFight(opponent)
                fight()
            case .bossBattle(let boss):
                prepareBossFight(boss)
                fight()
            case .treasure(let type, let items, let coins):
                openTreasureBox(type: type, items: items, coins: coins)
            case .shop(let type, let items):
                print("Oh wow, a shop! I wish someone would write the necessary code to actually go shopping...")
            }
        }
        print("That was a very long day! Time to relax at the local tavern.")
        currentTime = .night
    }
    
    func generateStarterItems() {
        bag.items =  ItemLibrary.randomItems(amount: Int.random(in: 5...7))
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
    
    func prepareBossFight(_ boss: Boss? = nil) {
        if boss != nil {
            currentBoss = boss!
            currentOpponents = [currentBoss]
        } else {
            currentBoss = BossLibrary.randomBoss()
            currentOpponents = [currentBoss]
        }
    }
    
    func prepareRegularFight(_ opponent: Opponent? = nil) {
        let amountOfOpponents = Int.random(in: 1...3)
        currentOpponents = []
        let newOpponent: Opponent
        if opponent != nil {
            newOpponent = opponent!
        } else {
            newOpponent = OpponentLibrary.randomOpponent()
        }
        for _ in 0..<amountOfOpponents {
            currentOpponents.append(newOpponent.copy())
        }
    }
    
    func fight() {
        print("\(currentOpponents[0].name) appears. The fight begins!")
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
        var gameIsRunning: Bool = true
        generateStarterItems()
        party = [hero1, hero2, hero3, hero4]
        prepareBossFight()
        fight()
        while gameIsRunning {
            if currentTime == .day {
                travel()
            } else {
                //visitTavern()
            }
        }
    }
    
    init() {}
}
