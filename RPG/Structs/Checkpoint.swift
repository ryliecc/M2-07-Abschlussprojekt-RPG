//
//  Checkpoint.swift
//  RPG
//
//  Created by Rylie Castell on 27.04.25.
//

import Foundation

struct Checkpoint {
    var type: CheckpointType
    var details: CheckpointDetails
    
    static func generateRandomCheckpoint() -> Checkpoint {
        let randomType = CheckpointType.allCases.randomElement()!
        let checkpoint: Checkpoint
        
        switch randomType {
        case .battle:
            checkpoint = Checkpoint(type: .battle, details: .battle(opponent: OpponentLibrary.randomOpponent()))
        case .bossBattle:
            checkpoint = Checkpoint(type: .bossBattle, details: .bossBattle(boss: BossLibrary.randomBoss()))
        case .shop:
            let shoptype: ShopType = ShopType.allCases.randomElement()!
            var items: [Item]
            switch shoptype {
            case .consumable:
                items = ItemLibrary.consumableItems
            case .equippable:
                items = ItemLibrary.equippableItems
            case .rare:
                items = ItemLibrary.rareItems
            }
            checkpoint = Checkpoint(type: .shop, details: .shop(type: shoptype, items: items))
        case .treasure:
            let amountOfItems = Int.random(in: 1...3)
            checkpoint = Checkpoint(type: .treasure, details: .treasure(type: TreasureType.allCases.randomElement()!, items: ItemLibrary.randomItems(amount: amountOfItems), coins: Int.random(in: 20...100)))
        }
        return checkpoint
    }
}
