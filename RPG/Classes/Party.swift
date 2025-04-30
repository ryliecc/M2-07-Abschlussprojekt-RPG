//
//  Party.swift
//  RPG
//
//  Created by Rylie Castell on 28.04.25.
//

import Foundation

class Party: CustomStringConvertible {
    var members: [Hero]
    var reserve: [Hero]
    var meetableHeroes: [Hero]
    var coins: Int = 0
    var bag: Bag = Bag(items: [])
    var isAbleToFight: Bool { members.contains { $0.isAlive }}
    
    init(initialHeroes: [Hero] = [], reserve: [Hero] = [], meetableHeroes: [Hero] = []) {
        self.members = initialHeroes
        self.reserve = reserve
        self.meetableHeroes = meetableHeroes
    }
    
    var description: String {
        let splitLines = members.map { $0.description.components(separatedBy: "\n") }
        let columnWidths = splitLines.map { lines in lines.map { $0.count }.max() ?? 0 }
        let maxLines = splitLines.map { $0.count }.max() ?? 0
        var result = ""
        for i in 0..<maxLines {
            let line = zip(splitLines, columnWidths).map { (lines, width) in
                if i < lines.count {
                    let content = lines[i]
                    if i == 0 {
                        let padding = max(0, width - content.count)
                        let leftPadding = padding / 2
                        let rightPadding = padding - leftPadding
                        return String(repeating: " ", count: leftPadding) + content + String(repeating: " ", count: rightPadding)
                    } else {
                        return content.padding(toLength: width, withPad: " ", startingAt: 0)
                    }
                } else {
                    return String(repeating: " ", count: width)
                }
            }.joined(separator: "   ")
            result += line + "\n"
        }
        return result
    }
    
    func preparePartyAtStart() {
        let allAvailableHeroes = HeroLibrary.heroFactories.map { $0() }
        members = []
        reserve = []
        print("Choose 4 Heroes for your party!")
        var selectedHeroes: [Hero] = []
        var availableChoices = allAvailableHeroes
        
        while selectedHeroes.count < 4 {
            print("\nAvailable Hero classes:")
            for (index, hero) in availableChoices.enumerated() {
                print("[\(index + 1)] - \(hero.name): \(hero.classDescription)")
            }
            
            let choice = enterInteger(min: 1, max: availableChoices.count)
            let chosenHero = availableChoices.remove(at: choice - 1)
            selectedHeroes.append(chosenHero)
            print("\nAdded \(chosenHero.name) to your party.")
        }
        
        members = selectedHeroes
        meetableHeroes = availableChoices
        
        print("\nYour party is ready:")
        for hero in members {
            print("- \(hero.name)")
        }
        
        if meetableHeroes.count >= 1 {
            print("\nYou will meet more heroes in the future!")
        }
    }
    
    func addMember(_ hero: Hero) {
        members.append(hero)
    }
    
    func removeMember(_ name: String) {
        if let index = members.firstIndex(where: { $0.name == name }) {
            members.remove(at: index)
        }
    }
    
    func swapMember(activeName: String, reserveName: String) {
        if let activeMemberIndex = members.firstIndex(where: { $0.name == activeName }),
           let reserveMemberIndex = reserve.firstIndex(where: { $0.name == reserveName}) {
            let activeHero = members[activeMemberIndex]
            let reserveHero = reserve[reserveMemberIndex]
            members[activeMemberIndex] = reserveHero
            reserve[reserveMemberIndex] = activeHero
            print("\n\(activeName) was replaced by \(reserveName).")
        }
    }
    
    func chooseSwapMenu() {
        let chosenReserve: Hero
        let chosenMember: Hero
        print("\nThe following heroes can be swapped for one of your party members:")
        for (index, hero) in reserve.enumerated() {
            print("[\(index + 1)] - \(hero.name) Lvl. \(hero.level)")
        }
        print("[\(reserve.count + 1)] - Go back")
        let chosenReserveOption = enterInteger(min: 1, max: reserve.count + 1) - 1
        if chosenReserveOption == reserve.count {
            return
        }
        chosenReserve = reserve[chosenReserveOption]
        print("\nYou have chosen \(chosenReserve.name).\nWho do you want them to swap places with?")
        for (index, hero) in members.enumerated() {
            print("[\(index + 1)] - \(hero.name) Lvl. \(hero.level)")
        }
        print("[\(members.count + 1)] - Go back")
        let chosenActiveOption = enterInteger(min: 1, max: members.count + 1) - 1
        if chosenActiveOption == members.count {
            chooseSwapMenu()
        }
        chosenMember = members[chosenActiveOption]
        print("\nYou are about to add \(chosenReserve.name) to your party in exchange for \(chosenMember.name). Are you sure you want to do that?")
        if confirmation() {
            swapMember(activeName: chosenMember.name, reserveName: chosenReserve.name)
        } else {
            chooseSwapMenu()
        }
    }
    
    func addItem(_ item: Item) {
        bag.addItem(item)
    }
    
    func removeItem(_ item: Item) {
        if let itemIndex = bag.items.firstIndex(where: { $0.name == item.name }) {
            bag.items.remove(at: itemIndex)
        }
    }
    
    func spendCoins(_ amount: Int) -> Bool {
        if coins >= amount {
            coins -= amount
            print("\n\(amount) Coins spent. You have \(coins) left.")
            return true
        }
        print("\nYou don't have enough Coins to do that.")
        return false
    }
    
    func earnCoins(_ amount: Int) {
        coins += amount
    }
    
    func healMembers(overNight: Bool = true) {
        for member in members {
            member.healAfterFight()
        }
        if overNight {
            for member in members {
                member.healOverNight()
            }
        }
    }
    
    func distributeExperience(_ amount: Int) {
        let livingHeroes = members.filter { $0.isAlive }
        let inverseLevelSum = livingHeroes.reduce(0.0) { $0 + 1.0 / Double($1.level) }
        
        for hero in livingHeroes {
            let levelWeight = (1.0 / Double(hero.level)) / inverseLevelSum
            let experienceForHero = Int(round(Double(amount) * levelWeight))
            hero.gainExperience(experienceForHero)
        }
    }
}
