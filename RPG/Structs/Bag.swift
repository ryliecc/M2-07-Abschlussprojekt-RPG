//
//  Bag.swift
//  RPG
//
//  Created by Rylie Castell on 23.04.25.
//

import Foundation

struct Bag: CustomStringConvertible {
    var items: [Item]
    var groupedItems: [String: [Item]] {
        Dictionary(grouping: items, by: { $0.name })
    }
    
    var description: String {
        return "The bag contains the following items:\n" + items.map { $0.description }.joined(separator: "\n")
    }
    
    mutating func menu(_ hero: Hero) -> Item? {
        if items.count == 0 {
            print("Your bag is empty.")
            waitForPlayerContinue()
            clearConsole()
            return nil
        }
        print("The following items are available:")
        var itemCounter: Int = 1
        var options: [(String)] = []
        for (name, items) in groupedItems {
            options.append(name)
            let currentItem: Item = items.first!
            print("\n[\(String(itemCounter).applyConsoleStyles(.bold))] \(items.count)x \(currentItem.description)")
            itemCounter += 1
        }
        print("\n[\(String(itemCounter).applyConsoleStyles(.bold))] " + "Go back".applyConsoleStyles(.italic))
        print("Which item should \(hero.name) use?")
        let chosenOption = enterInteger(max: itemCounter)
        if chosenOption == itemCounter {
            return nil
        }
        let chosenItem = items.first(where: { $0.name == options[chosenOption - 1] })
        if chosenItem!.isEquippable && hero.equippedItem != nil {
            print("\(hero.name) already has \(hero.equippedItem!.styledName) equipped. Are you sure you want to equip \(chosenItem!.styledName) instead? The effects of \(hero.equippedItem!.styledName) are gonna last \(hero.equippedRoundCounter) more rounds if not.")
            if confirmation() {
                hero.equippedItem = nil
                return chosenItem
            } else {
                return menu(hero)
            }
        }
        return chosenItem
    }
    
    mutating func addItem(_ item: Item) {
        items.append(item)
    }
    
    mutating func loseRandomItem() {
        if let item = items.randomElement() {
            let index = items.firstIndex(where: { $0.name == item.name })
            items.remove(at: index!)
            print("You lost one \(item.styledName).")
        } else {
            print("Your bag was already completely empty, so you didn't lose anything. Lucky you!")
        }
    }
}
