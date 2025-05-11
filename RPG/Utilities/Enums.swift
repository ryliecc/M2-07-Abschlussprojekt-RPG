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
    case battle(amount: Int)
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
    case tavern
}

enum EventRarity: Int {
    case common = 60
    case uncommon = 30
    case rare = 10
}

enum EventTime {
    case day
    case night
    case both
}

enum ConsoleStyle: String {
    case reset = "\u{001B}[0m"
    case black = "\u{001B}[30m"
    case red = "\u{001B}[31m"
    case green = "\u{001B}[32m"
    case yellow = "\u{001B}[33m"
    case blue = "\u{001B}[34m"
    case magenta = "\u{001B}[35m"
    case cyan = "\u{001B}[36m"
    case white = "\u{001B}[37m"
    
    case brightBlack = "\u{001B}[90m"
    case brightRed = "\u{001B}[91m"
    case brightGreen = "\u{001B}[92m"
    case brightYellow = "\u{001B}[93m"
    case brightBlue = "\u{001B}[94m"
    case brightMagenta = "\u{001B}[95m"
    case brightCyan = "\u{001B}[96m"
    case brightWhite = "\u{001B}[97m"
    
    case backgroundRed = "\u{001B}[41m"
    case backgroundGreen = "\u{001B}[42m"
    case backgroundYellow = "\u{001B}[43m"
    case backgroundBlue = "\u{001B}[44m"
    case backgroundMagenta = "\u{001B}[45m"
    case backgroundCyan = "\u{001B}[46m"
    case backgroundWhite = "\u{001B}[47m"
    
    case bold = "\u{001B}[1m"
    case italic = "\u{001B}[3m"
    case underlined = "\u{001B}[4m"
    case strikethrough = "\u{001B}[9m"
    case inverse = "\u{001B}[7m"
    case dim = "\u{001B}[2m"
}

enum GameMove: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissors = "Scissors"
    
    var beats: GameMove {
        switch self {
        case .rock: return .scissors
        case .paper: return .rock
        case .scissors: return .paper
        }
    }
    
    func outcome(against opponent: GameMove) -> GameResult {
        if self == opponent {
            return .draw
        } else if self.beats == opponent {
            return .win
        } else {
            return .lose
        }
    }
}

enum GameResult {
    case draw
    case win
    case lose
}

enum HealthStatus {
    case healthy
    case injured
    case critical
    case dead
}
