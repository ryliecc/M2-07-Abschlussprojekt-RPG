//
//  ItemLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

struct ItemLibrary {
    static let healingPotion = Item(name: "Healing Potion", attackPoints: 0, defensePoints: 0, healthPoints: 20, manaPoints: 0, numberOfUsages: 1, isConsumable: true, isEquippable: false, infoText: "A sparkling red potion that mends wounds and restores vitality.", actionText: "The hero feels a warm light flowing through their veins. 20 HP were restored.")
    
    static let manaElixir = Item(name: "Mana Elixir", attackPoints: 0, defensePoints: 0, healthPoints: 0, manaPoints: 15, numberOfUsages: 1, isConsumable: true, isEquippable: false, infoText: "A swirling blue elixir said to refill the mind’s magical energy.", actionText: "The hero's mind clears and magical energy surges back. 15 MP were restored.")
    
    static let ironShield = Item(name: "Iron Shield", attackPoints: 0, defensePoints: 5, healthPoints: 0, manaPoints: 0, numberOfUsages: 3, isConsumable: false, isEquippable: true, infoText: "A sturdy shield forged by master blacksmiths, perfect for withstanding brutal blows.", actionText: "The hero feels protected behind solid iron. Defense increased by 5.")
    
    static let sharpenedSword = Item(name: "Sharpened Sword", attackPoints: 5, defensePoints: 0, healthPoints: 0, manaPoints: 0, numberOfUsages: 3, isConsumable: false, isEquippable: true, infoText: "A finely honed blade that slices through armor like butter.", actionText: "The hero’s strikes become deadlier and more precise. Attack increased by 5 for 3 rounds.")
    
    static let vitalityHerb = Item(name: "Vitality Herb", attackPoints: 0, defensePoints: 0, healthPoints: 10, manaPoints: 5, numberOfUsages: 1, isConsumable: true, isEquippable: false, infoText: "A rare herb said to restore both body and spirit when chewed.", actionText: "A refreshing sensation fills the hero. 10 HP and 5 MP were restored.")
    
    static let cursedAmulet = Item(name: "Cursed Amulet", attackPoints: 3, defensePoints: 0, healthPoints: -5, manaPoints: 10, numberOfUsages: 2, isConsumable: false, isEquippable: true, infoText: "A dark talisman pulsing with forbidden magic, tempting the reckless.", actionText: "The hero feels dark power surge through them. +3 Attack and +10 MP, but 5 HP were lost.")
    
    static let lightCloak = Item(name: "Light cloak", attackPoints: 0, defensePoints: 3, healthPoints: 0, manaPoints: 0, numberOfUsages: 5, isConsumable: false, isEquippable: true, infoText: "A cloak woven from enchanted silk, making the wearer swift and elusive.", actionText: "The hero moves with grace and speed. Defense increased by 3.")
    
    static let berserkerTonic = Item(name: "Berserker Tonic", attackPoints: 7, defensePoints: -3, healthPoints: 0, manaPoints: 0, numberOfUsages: 1, isConsumable: true, isEquippable: false, infoText: "A vicious brew that fills the drinker with unstoppable rage, at a terrible cost.", actionText: "The hero is overcome by a berserker rage. Attack increased by 7, but Defense decreased by 3.")
    
    static let phoenixFeather = Item(name: "Phoenix Feather", attackPoints: 0, defensePoints: 0, healthPoints: 50, manaPoints: 20, numberOfUsages: 1, isConsumable: true, isEquippable: false, infoText: "A shimmering feather brimming with the healing flames of a mythical bird.", actionText: "The hero is enveloped in rejuvenating flames. 50 HP and 20 MP were restored.")
    
    static let knightGauntlets = Item(name: "Knight Gauntlets", attackPoints: 2, defensePoints: 2, healthPoints: 0, manaPoints: 0, numberOfUsages: 4, isConsumable: false, isEquippable: true, infoText: "Battle-worn gloves once worn by a legendary knight, enhancing strength and resilience.", actionText: "The hero feels the spirit of a true warrior awaken. Attack and Defense increased by 2.")
    
    static var allItems: [Item] = [healingPotion, manaElixir, ironShield, sharpenedSword, vitalityHerb, cursedAmulet, lightCloak, berserkerTonic, phoenixFeather, knightGauntlets]
    
    static var equippableItems: [Item] = allItems.filter { $0.isEquippable }
    static var consumableItems: [Item] = allItems.filter { $0.isConsumable }
    static var rareItems: [Item] = [cursedAmulet, phoenixFeather]
    
    static func randomItem() -> Item {
        return allItems.randomElement()!
    }
    static func randomItems(amount: Int) -> [Item] {
        var items: [Item] = []
        for _ in 0..<amount {
            items.append(randomItem())
        }
        return items
    }
}
