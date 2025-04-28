//
//  Enums.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

enum AttackType {
    case damage
    case heal
    case trap
    case manaRestore
    case buffAttack
    case buffDefense
    case debuffAttack
    case debuffDefense
    case areaDamage
    case ultimate
}

enum CheckpointType: CaseIterable {
    case battle
    case bossBattle
    case treasure
    case shop
}

enum CheckpointDetails {
    case battle(opponent: Opponent)
    case bossBattle(boss: Boss)
    case treasure(type: TreasureType, items: [Item], coins: Int)
    case shop(type: ShopType)
}

enum TimeOfDay {
    case day
    case night
}

enum TreasureType: CaseIterable {
    case item
    case coins
}

enum ShopType: CaseIterable {
    case equippable
    case consumable
    case rare
}
