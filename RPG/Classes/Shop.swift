//
//  Shop.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

class Shop {
    let type: ShopType
    var itemsForSale: [Item] = []
    var itemPrices: [String: Int] = [:]
    var hasSale: Bool
    
    private func generateItems() {
        switch type {
        case .consumable:
            itemsForSale = ItemLibrary.consumableItems
        case .equippable:
            itemsForSale = ItemLibrary.equippableItems
        case .rare:
            itemsForSale = ItemLibrary.rareItems
        }
        for item in itemsForSale {
            var itemPrice = ItemLibrary.itemPrices[item.name]
            if hasSale {
                itemPrice! = Int(Double(itemPrice!) / 100 * 70 .rounded())
            }
            itemPrices[item.name] = itemPrice
        }
    }
    
    func menu(_ party: Party) {
        print("Welcome to the shop.\(hasSale ? " Everything is 30% on sale today!" : "") The following items are available:")
        for (index, item) in itemsForSale.enumerated() {
            print("[\(index + 1)] \(item.name)\n\(item.infoText)\nPrice: \(String(describing: itemPrices[item.name])) Coins")
        }
        print("[\(itemsForSale.count + 1)] Leave")
        print("Please choose what you want to do.")
        let chosenIndex = enterInteger(min: 1, max: itemsForSale.count + 1) - 1
        if chosenIndex == itemsForSale.count {
            return
        } else {
            let chosenItem = itemsForSale[chosenIndex]
            if party.spendCoins(itemPrices[chosenItem.name]!) {
                party.addItem(chosenItem)
                print("Thank you! Can we help you with anything else?")
                menu(party)
            } else {
                print("Oh, it looks like you don't have enough coins to purchase that. Can we help you with anything else?")
                menu(party)
            }
        }
    }
    
    init(type: ShopType, hasSale: Bool = false) {
        self.type = type
        self.hasSale = hasSale
        generateItems()
    }
}
