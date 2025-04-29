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
            itemsForSale = ItemLibrary.randomItems(amount: 5, type: type)
        case .equippable:
            itemsForSale = ItemLibrary.randomItems(amount: 5, type: type)
        case .rare:
            itemsForSale = ItemLibrary.randomItems(amount: 5, type: type)
        }
        for (index, item) in itemsForSale.enumerated() {
            if var itemPrice = ItemLibrary.itemPrices[item.name] {
                if hasSale {
                    itemPrice = Int(Double(itemPrice) / 100 * 70 .rounded())
                }
                itemPrices[item.name] = itemPrice
            } else {
                print("+++++ DEBUG MESSAGE: ItemLibrary.itemPrices does not return a price for \(item.name). It was removed from the shop array to avoid any crashes. Add a price for the Item to get rid of this message and display the Shop correctly. +++++")
                itemsForSale.remove(at: index)
            }
        }
    }
    
    func menu(_ party: Party) {
        print("Welcome to the shop.\(hasSale ? " Everything is 30% on sale today!" : "") The following items are available:")
        for (index, item) in itemsForSale.enumerated() {
            print("[\(index + 1)] \(item.name)\n\(item.infoText)\nPrice: \(itemPrices[item.name]!)) Coins")
        }
        print("[\(itemsForSale.count + 1)] Leave")
        print("Available Coins: \(party.coins)")
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
