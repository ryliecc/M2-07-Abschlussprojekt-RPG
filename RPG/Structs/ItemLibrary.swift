//
//  ItemLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

struct ItemLibrary {
    static let healingPotion = Item(name: "Healing Potion", attackPoints: 0, defensePoints: 0, healthPoints: 20, manaPoints: 0, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A sparkling red potion that mends wounds and restores vitality.", actionText: "The hero feels a warm light flowing through their veins. 20 HP were restored.")
    
    static let manaElixir = Item(name: "Mana Elixir", attackPoints: 0, defensePoints: 0, healthPoints: 0, manaPoints: 15, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A swirling blue elixir said to refill the mind’s magical energy.", actionText: "The hero's mind clears and magical energy surges back. 15 MP were restored.")
    
    static let ironShield = Item(name: "Iron Shield", attackPoints: 0, defensePoints: 5, healthPoints: 0, manaPoints: 0, numberOfUsages: 3, isConsumable: false, isRare: false, infoText: "A sturdy shield forged by master blacksmiths, perfect for withstanding brutal blows.", actionText: "The hero feels protected behind solid iron. Defense increased by 5.")
    
    static let sharpenedSword = Item(name: "Sharpened Sword", attackPoints: 5, defensePoints: 0, healthPoints: 0, manaPoints: 0, numberOfUsages: 3, isConsumable: false, isRare: false, infoText: "A finely honed blade that slices through armor like butter.", actionText: "The hero’s strikes become deadlier and more precise. Attack increased by 5 for 3 rounds.")
    
    static let vitalityHerb = Item(name: "Vitality Herb", attackPoints: 0, defensePoints: 0, healthPoints: 10, manaPoints: 5, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A rare herb said to restore both body and spirit when chewed.", actionText: "A refreshing sensation fills the hero. 10 HP and 5 MP were restored.")
    
    static let cursedAmulet = Item(name: "Cursed Amulet", attackPoints: 3, defensePoints: 0, healthPoints: -5, manaPoints: 10, numberOfUsages: 2, isConsumable: false, isRare: true, infoText: "A dark talisman pulsing with forbidden magic, tempting the reckless.", actionText: "The hero feels dark power surge through them. +3 Attack and +10 MP, but 5 HP were lost.")
    
    static let lightCloak = Item(name: "Light Cloak", attackPoints: 0, defensePoints: 3, healthPoints: 0, manaPoints: 0, numberOfUsages: 5, isConsumable: false, isRare: false, infoText: "A cloak woven from enchanted silk, making the wearer swift and elusive.", actionText: "The hero moves with grace and speed. Defense increased by 3.")
    
    static let berserkerTonic = Item(name: "Berserker Tonic", attackPoints: 7, defensePoints: -3, healthPoints: 0, manaPoints: 0, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A vicious brew that fills the drinker with unstoppable rage, at a terrible cost.", actionText: "The hero is overcome by a berserker rage. Attack increased by 7, but Defense decreased by 3.")
    
    static let phoenixFeather = Item(name: "Phoenix Feather", attackPoints: 0, defensePoints: 0, healthPoints: 50, manaPoints: 20, numberOfUsages: 1, isConsumable: true, isRare: true, infoText: "A shimmering feather brimming with the healing flames of a mythical bird.", actionText: "The hero is enveloped in rejuvenating flames. 50 HP and 20 MP were restored.")
    
    static let knightGauntlets = Item(name: "Knight Gauntlets", attackPoints: 2, defensePoints: 2, healthPoints: 0, manaPoints: 0, numberOfUsages: 4, isConsumable: false, isRare: false, infoText: "Battle-worn gloves once worn by a legendary knight, enhancing strength and resilience.", actionText: "The hero feels the spirit of a true warrior awaken. Attack and Defense increased by 2.")
    
    static let energyBiscuit = Item(name: "Energy Biscuit", attackPoints: 0, defensePoints: 0, healthPoints: 5, manaPoints: 10, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A sweet snack that restores magical energy and a bit of health.", actionText: "The hero feels slightly refreshed. 5 HP and 10 MP were restored.")

    static let furySpice = Item(name: "Fury Spice", attackPoints: 5, defensePoints: -2, healthPoints: 0, manaPoints: 0, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A hot, magical spice that boosts attack temporarily.", actionText: "The hero’s eyes flare with rage. Attack +5, but Defense -2.")

    static let turtleShellBrew = Item(name: "Turtle Shell Brew", attackPoints: 0, defensePoints: 6, healthPoints: 0, manaPoints: 0, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A thick brew that grants strong natural armor for a short while.", actionText: "The hero’s skin hardens. Defense increased by 6 for 3 turns.")

    static let clarityLeaf = Item(name: "Clarity Leaf", attackPoints: 0, defensePoints: 0, healthPoints: 0, manaPoints: 20, numberOfUsages: 1, isConsumable: true, isRare: false, infoText: "A sacred herb used to focus the mind before casting spells.", actionText: "The hero feels mentally sharp. +20 MP restored.")
    
    static let steelGreaves = Item(name: "Steel Greaves", attackPoints: 0, defensePoints: 4, healthPoints: 0, manaPoints: 0, numberOfUsages: 4, isConsumable: false, isRare: false, infoText: "Heavy leg armor offering excellent lower-body protection.", actionText: "The hero moves with heavy steps. Defense +4.")

    static let enchantedBracelet = Item(name: "Enchanted Bracelet", attackPoints: 2, defensePoints: 1, healthPoints: 0, manaPoints: 5, numberOfUsages: 3, isConsumable: false, isRare: false, infoText: "A charm that gently enhances magical and physical abilities.", actionText: "The bracelet glows faintly. Stats slightly improved.")

    static let battleMask = Item(name: "Battle Mask", attackPoints: 3, defensePoints: 2, healthPoints: 0, manaPoints: 0, numberOfUsages: 3, isConsumable: false, isRare: false, infoText: "A mask that inspires fear and focus in battle.", actionText: "The hero’s aura intensifies. +3 Attack, +2 Defense.")

    static let reinforcedBoots = Item(name: "Reinforced Boots", attackPoints: 0, defensePoints: 3, healthPoints: 5, manaPoints: 0, numberOfUsages: 4, isConsumable: false, isRare: false, infoText: "Boots with hidden padding that absorb damage and fatigue.", actionText: "The hero stands firm. Defense +3 and +5 HP.")
    
    static let dragonScaleMail = Item(name: "Dragon Scale Mail", attackPoints: 0, defensePoints: 8, healthPoints: 20, manaPoints: 0, numberOfUsages: 5, isConsumable: false, isRare: true,
        infoText: "Armor crafted from ancient dragon scales, nearly impenetrable.", actionText: "The hero is covered in shimmering scales. Massive defense boost!")

    static let mindfireTome = Item(name: "Mindfire Tome", attackPoints: 5, defensePoints: 0, healthPoints: 0, manaPoints: 30, numberOfUsages: 3, isConsumable: false, isRare: true,
        infoText: "A forbidden book that grants the reader great magical power.",
        actionText: "The hero’s eyes burn with arcane knowledge. Attack +5, MP +30.")

    static let ghostBlade = Item(name: "Ghost Blade", attackPoints: 10, defensePoints: 0, healthPoints: -10, manaPoints: 0, numberOfUsages: 2, isConsumable: false, isRare: true,
        infoText: "A spectral weapon that trades life for extreme power.", actionText: "The hero slashes with otherworldly force. +10 Attack, -10 HP.")

    static let sapphireRing = Item(name: "Sapphire Ring", attackPoints: 0, defensePoints: 2, healthPoints: 0, manaPoints: 25, numberOfUsages: 3, isConsumable: false, isRare: true,
        infoText: "A shimmering ring that stores deep reserves of mana.", actionText: "The ring pulses with energy. +25 MP and +2 Defense.")
    
    static var allItems: [Item] = [healingPotion, manaElixir, ironShield, sharpenedSword, vitalityHerb, cursedAmulet, lightCloak, berserkerTonic, phoenixFeather, knightGauntlets, energyBiscuit, furySpice, turtleShellBrew, clarityLeaf, steelGreaves, enchantedBracelet, battleMask, reinforcedBoots, dragonScaleMail, mindfireTome, ghostBlade, sapphireRing]
    
    static var equippableItems: [Item] = allItems.filter { $0.isEquippable && !$0.isRare }
    static var consumableItems: [Item] = allItems.filter { $0.isConsumable && !$0.isRare }
    static var rareItems: [Item] = allItems.filter { $0.isRare }
    
    static var itemPrices: [String:Int] = [
        healingPotion.name:10,
        manaElixir.name:10,
        ironShield.name:25,
        sharpenedSword.name:25,
        vitalityHerb.name:18,
        cursedAmulet.name:40,
        lightCloak.name:25,
        berserkerTonic.name:30,
        phoenixFeather.name:80,
        knightGauntlets.name:25,
        energyBiscuit.name: 12,
        furySpice.name: 18,
        turtleShellBrew.name: 22,
        clarityLeaf.name: 20,
        steelGreaves.name: 25,
        enchantedBracelet.name: 26,
        battleMask.name: 28,
        reinforcedBoots.name: 24,
        dragonScaleMail.name: 75,
        mindfireTome.name: 70,
        ghostBlade.name: 60,
        sapphireRing.name: 55
    ]
    
    static func randomItem(type: ShopType? = nil) -> Item {
        if type == nil {
            return allItems.randomElement()!
        }
        switch type {
        case .consumable:
            return consumableItems.randomElement()!
        case .equippable:
            return equippableItems.randomElement()!
        case .rare:
            return rareItems.randomElement()!
        case .none:
            return allItems.randomElement()!
        }
    }
    static func randomItems(amount: Int, type: ShopType? = nil) -> [Item] {
        let pool: [Item]
        switch type {
        case .none:
            pool = allItems
        case .consumable:
            pool = consumableItems
        case .equippable:
            pool = equippableItems
        case .rare:
            pool = rareItems
        }
        if pool.count <= amount {
            print("+++++ DEBUG MESSAGE: Method ItemLibrary.randomItems() does not return an actual random Array, but instead just the whole copy of the specified type. Consider adding more Items to the Library to get rid of this warning. +++++")
        }
        let items = Array(pool.shuffled().prefix(amount))
        return items
    }
}
