//
//  Game.swift
//  RPG
//
//  Created by Rylie Castell on 24.04.25.
//

import Foundation

class Game: BossDelegate, OpponentDelegate {
    
    var party: Party
    
    var difficultyLevel: Int = 1
    
    var currentBoss: Boss {
        didSet {
            currentBoss.bossDelegate = self
        }
    }
    var currentHenchman: Henchman? {
        return currentBoss.henchman
    }
    var currentOpponents: [Opponent] = [] {
        didSet {
            for opponent in currentOpponents {
                opponent.opponentDelegate = self
            }
        }
    }
    var defeatedOpponents: [Opponent] = []
    
    var currentTime: TimeOfDay = .day {
        didSet {
            if currentTime == .night {
                generateCheckpoints()
            }
            if currentTime == .day {
                nextTavern = Tavern()
            }
        }
    }
    var nextCheckpoints: [Checkpoint] = []
    var nextTavern: Tavern
    var dayCounter: Int = 0
    
    func triggerRandomEvent() {
        var time: EventTime
        if currentTime == .day {
            time = .day
        } else {
            time = .night
        }
        let matchingEvents = EventLibrary.allEvents.filter {
            $0.time == time || $0.time == .both
        }
        
        var weightedPool: [GameEvent] = []
        for event in matchingEvents {
            weightedPool += Array(repeating: event, count: event.rarity.rawValue)
        }
        
        guard let selectedEvent = weightedPool.randomElement() else {
            print("\n+++++ DEBUG MESSAGE: No event occurred. Check if Event Library contains events for all cases. +++++".applyConsoleStyles(.bold, .red))
            return
        }
        
        print("\nEvent triggered: \(selectedEvent.name)\n")
        print(selectedEvent.description)
        selectedEvent.effect(&party)
        waitForPlayerContinue()
        clearConsole()
    }
        
    
    func generateCheckpoints() {
        let numberOfCheckpoints = Int.random(in: 3...5)
        var randomCheckpoints: [Checkpoint] = []
        for _ in 0..<numberOfCheckpoints {
            randomCheckpoints.append(Checkpoint.generateRandomCheckpoint())
        }
        if !randomCheckpoints.contains(where: { $0.type == .bossBattle }) {
            let randomBossBattleCheckpoint: Checkpoint = Checkpoint(type: .bossBattle, details: .bossBattle(boss: BossLibrary.randomBoss(difficultyLevel: difficultyLevel)))
            randomCheckpoints[numberOfCheckpoints - 1] = randomBossBattleCheckpoint
        } else {
            randomCheckpoints.append(Checkpoint.generateRandomCheckpoint())
        }
        nextCheckpoints = randomCheckpoints
    }
    
    func openTreasureBox(type: TreasureType, items: [Item], coins: Int) {
        print("\nYou found a treasure box. Let's see what's in there...")
        switch type {
        case .item:
            for item in items {
                print("\nYou found \(item.styledName).")
                party.addItem(item)
                print("\(item.styledName) was added to your bag.")
            }
        case .coins:
            print("You found " + "\(coins) gold coins".applyConsoleStyles(.yellow) + "!")
            party.earnCoins(coins)
        }
    }
    
    func travel() {
        for (index, checkpoint) in nextCheckpoints.enumerated() {
            if currentTime == .night {
                break
            }
            print("\nYou travel along the road ...")
            if index == 2 {
                triggerRandomEvent()
            }
            switch checkpoint.details {
            case .battle(var amount):
                amount = Int.random(in: 1...3)
                prepareRegularFight(amount)
                fight()
                for member in party.members {
                    member.healAfterFight()
                }
            case .bossBattle(let boss):
                prepareBossFight(boss)
                fight()
                for member in party.members {
                    member.healAfterFight()
                }
            case .treasure(let type, let items, let coins):
                openTreasureBox(type: type, items: items, coins: coins)
            case .shop(let type):
                let shop = Shop(type: type)
                shop.menu(party)
            }
            waitForPlayerContinue()
            clearConsole()
        }
        print("\nThat was a very long day! Time to find a place to sleep.")
        currentTime = .night
    }
    
    func visitTavern() {
        nextTavern.menu(party)
        triggerRandomEvent()
        print("\nEveryone slept well that night and woke up refreshed and ready for new adventures.")
        currentTime = .day
        waitForPlayerContinue()
        clearConsole()
    }
    
    func generateStarterItems() {
        let starterItems = ItemLibrary.randomItems(amount: Int.random(in: 5...7))
        for item in starterItems {
            party.addItem(item)
        }
    }
    
    func bossCalledHenchman() {
        currentOpponents.append(currentHenchman!)
        print("\n\(currentHenchman!.name) joined the fight.")
    }
    
    func checkIfBothSidesCanFight() -> Bool {
        if party.members.contains(where: { $0.isAlive }) && currentOpponents.contains(where: { $0.isAlive }) {
            return true
        } else {
            return false
        }
    }
    
    func handleBattleEnd() {
        let heroesAlive = party.members.contains(where: { $0.isAlive })
        if !heroesAlive {
            print("\nYou lost! All your heroes went K.O. but a friendly spirit brought them to the next tavern to heal.")
            currentTime = .night
            waitForPlayerContinue()
            clearConsole()
        } else {
            print("\nVictory! Your heroes have defeated all enemies!")
            var totalExperiencePoints: Int = 0
            var totalCoins: Int = 0
            
            for opponent in defeatedOpponents {
                opponent.healAfterFight()
                let experiencePoints: Int = Int(((opponent.maxHealthPoints * 1.1) + (opponent.attackPower * 2.5) + (opponent.defense * 1.7)).rounded())
                let coins: Int = Int(((opponent.attackPower + opponent.defense) * 2.5).rounded())
                totalExperiencePoints += experiencePoints
                totalCoins += coins
            }
            print("You won " + "\(totalCoins) coins".applyConsoleStyles(.yellow) + ".")
            party.earnCoins(totalCoins)
            party.distributeExperience(totalExperiencePoints)
        }
    }
    
    func printAllStatusInfos() {
        print(party)
        print()
        let splitLines = currentOpponents.map { $0.description.components(separatedBy: "\n") }
        let columnWidths = (0..<splitLines.count).map { columnIndex in
            let columnLines = splitLines[columnIndex]
            return columnLines.map { $0.visibleLength }.max() ?? 0
        }
        let maxLines = splitLines.map { $0.count }.max() ?? 0
        var result = ""
        for i in 0..<maxLines {
            let line = zip(splitLines, columnWidths).map { (lines, width) in
                if i < lines.count {
                    let content = lines[i]
                    if i == 0 {
                        let padding = max(0, width - content.visibleLength)
                        let leftPadding = padding / 2
                        let rightPadding = padding - leftPadding
                        return String(repeating: " ", count: leftPadding) + content + String(repeating: " ", count: rightPadding)
                    } else {
                        let visiblePadding = max(0, width - content.visibleLength)
                        return content + String(repeating: " ", count: visiblePadding)
                    }
                } else {
                    return String(repeating: " ", count: width)
                }
            }.joined(separator: "   ")
            result += line + "\n"
        }
        print(result)
    }
    
    func handleOpponentDeath(_ opponent: Opponent) {
        defeatedOpponents.append(opponent)
        if let index = currentOpponents.firstIndex(of: opponent) {
            currentOpponents.remove(at: index)
        }
    }
    
    func printTurnMenu(_ hero: Hero) {
        printAllStatusInfos()
        if !hero.isAlive {
            print("\n\(hero.name) is K.O. and cannot fight.")
            return
        }
        print("\nIt is \(hero.name)'s turn. What should they do?\n[" + "1".applyConsoleStyles(.bold) + "] Attack\n[" + "2".applyConsoleStyles(.bold) + "] Use Item")
        let choice: Int = enterInteger(max: 2)
        if choice == 1 {
            let chosenAttack: Attack? = hero.chooseAttack()
            if chosenAttack == nil {
                clearConsole()
                printTurnMenu(hero)
            } else {
                if !chosenAttack!.isSelfTargeting {
                    switch chosenAttack!.type {
                    case .damage, .debuffAttack, .debuffDefense, .ultimate:
                        if currentOpponents.count > 1 {
                            if let chosenOpponent: Opponent = hero.chooseTarget(possibleTargets: currentOpponents) {
                                hero.attack(chosenAttack!, on: chosenOpponent)
                            } else {
                                clearConsole()
                                printTurnMenu(hero)
                            }
                        } else {
                            hero.attack(chosenAttack!, on: currentOpponents[0])
                        }
                    case .buffAttack, .buffDefense, .heal, .manaRestore, .trap:
                        let chosenHero: Character? = hero.chooseTarget(possibleTargets: party.members)
                        if chosenHero == nil {
                            clearConsole()
                            printTurnMenu(hero)
                        } else {
                            hero.attack(chosenAttack!, on: chosenHero!)
                        }
                    case .areaDamage:
                        hero.attack(chosenAttack!, on: self.currentOpponents)
                    }
                } else {
                    hero.attack(chosenAttack!, on: nil)
                }
                
            }
        }
        if choice == 2 {
            let item: Item? = party.bag.menu(hero)
            if item == nil {
                clearConsole()
                printTurnMenu(hero)
            } else {
                party.removeItem(item!)
                hero.useItem(item!)
            }
        }
        if hero.equippedItem != nil {
            hero.equippedRoundCounter -= 1
            if hero.equippedRoundCounter < 0 {
                print("\n\(hero.equippedItem!.name) is used up. The temporary effects have ended.")
                hero.equippedItem = nil
            }
        }
    }
    
    func prepareBossFight(_ boss: Boss) {
        defeatedOpponents = []
        currentBoss = boss
        currentOpponents = [currentBoss]
        print("\n\(currentBoss.name) appears! The fight begins!")
        waitForPlayerContinue()
        clearConsole()
    }
    
    func prepareRegularFight(_ amount: Int) {
        defeatedOpponents = []
        currentOpponents = OpponentLibrary.randomOpponents(amount: amount, difficultyLevel: difficultyLevel)
        print("\n\(currentOpponents.count) \(currentOpponents[0].name)\(currentOpponents.count > 1 ? "s appear" : " appears"). The fight begins!")
        waitForPlayerContinue()
        clearConsole()
    }
    
    func fight() {
        var fightIsRunning: Bool = true
        var roundCounter: Int = 0
        while fightIsRunning {
            if checkIfBothSidesCanFight() {
                roundCounter += 1
                print("Round \(roundCounter)".highlight())
                party.members.shuffle()
                for hero in party.members {
                    printTurnMenu(hero)
                    if !checkIfBothSidesCanFight() {
                        fightIsRunning = false
                        waitForPlayerContinue()
                        clearConsole()
                        break
                    }
                    waitForPlayerContinue()
                    clearConsole()
                }
                for opponent in currentOpponents {
                    printAllStatusInfos()
                    let availableTargets: [Hero] = party.members.filter { $0.isAlive }
                    let randomAttack = opponent.chooseRandomAttack()
                    switch randomAttack.type {
                    case .areaDamage:
                        opponent.attack(randomAttack, on: availableTargets)
                    case .damage, .debuffAttack, .debuffDefense, .ultimate:
                        opponent.attack(randomAttack, on: availableTargets.randomElement()!)
                    case .buffAttack, .buffDefense, .heal, .manaRestore:
                        opponent.attack(randomAttack, on: currentOpponents.randomElement()!)
                    case .trap:
                        opponent.attack(randomAttack, on: nil)
                    }
                    if !checkIfBothSidesCanFight() {
                        fightIsRunning = false
                        waitForPlayerContinue()
                        clearConsole()
                        break
                    }
                    waitForPlayerContinue()
                    clearConsole()
                }
            } else {
                fightIsRunning = false
            }
        }
        handleBattleEnd()
    }
    
    func run() {
        var gameIsRunning: Bool = true
        generateStarterItems()
        party.preparePartyAtStart()
        nextCheckpoints = [Checkpoint(type: .treasure, details: .treasure(type: .coins, items: [], coins: 50)), Checkpoint(type: .treasure, details: .treasure(type: .item, items: ItemLibrary.randomItems(amount: 3), coins: 0)), Checkpoint(type: .shop, details: .shop(type: .equippable)), Checkpoint(type: .battle, details: .battle(amount: 2))]
        while gameIsRunning {
            if currentTime == .day {
                dayCounter += 1
                travel()
            } else {
                visitTavern()
                if dayCounter == 5 {
                    gameIsRunning = false
                }
            }
        }
        print("\nThank you for playing the test version.")
    }
    
    init() {
        self.party = Party()
        self.currentBoss = BossLibrary.randomBoss(difficultyLevel: difficultyLevel)
        self.nextTavern = Tavern()
    }
}
