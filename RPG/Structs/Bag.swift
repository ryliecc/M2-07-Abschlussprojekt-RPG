//
//  Bag.swift
//  RPG
//
//  Created by Rylie Castell on 23.04.25.
//

import Foundation

struct Bag {
    var items: [Item]
    
    mutating func menu(_ hero: Hero) -> Item? {
        print("The following items are available:")
        let availableItems = items.enumerated().filter { $0.element.numberOfUsages >= 1 }
        for (index, item) in availableItems.enumerated() {
            print("[\(index + 1)] \(item.element.name)")
        }
        print("[\(availableItems.count + 1)] Go back")
        print("Which item should \(hero.name) use?")
        var chosenIndex = enterInteger() - 1
        while chosenIndex < 0 || chosenIndex > availableItems.count {
            print("Wrong input. Please try again.")
            chosenIndex = enterInteger() - 1
        }
        if chosenIndex == availableItems.count {
            return nil
        }
        let originalIndex = availableItems[chosenIndex].offset
        items[originalIndex].numberOfUsages -= 1
        return items[originalIndex]
    }
    
    mutating func addItem(_ item: Item) {
        items.append(item)
    }
    
    private func enterInteger() -> Int {
                let input: Int? = Int(readLine()!)
                if input == nil {
                    return 0
                } else {
                    return input!
                }
            }
}
