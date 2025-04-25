//
//  Bag.swift
//  RPG
//
//  Created by Rylie Castell on 23.04.25.
//

import Foundation

struct Bag: CustomStringConvertible {
    var items: [Item]
    
    var description: String {
        return "The bag contains the following items:\n" + items.map { $0.description }.joined(separator: "\n")
    }
    
    mutating func menu(_ hero: Hero) -> Item? {
        print("The following items are available:")
        let availableItems = items.enumerated().filter { $0.element.numberOfUsages >= 1 }
        for (index, item) in availableItems.enumerated() {
            print("[\(index + 1)] \(item.element.name) (\(item.element.numberOfUsages) left)")
        }
        print("[\(availableItems.count + 1)] Go back")
        print("Which item should \(hero.name) use?")
        var chosenIndex = enterInteger(min: 1, max: availableItems.count + 1) - 1
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
}
