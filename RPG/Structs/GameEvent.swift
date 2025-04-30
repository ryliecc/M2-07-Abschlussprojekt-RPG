//
//  GameEvent.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

struct GameEvent {
    let name: String
    let description: String
    let rarity: EventRarity
    let time: EventTime
    let effect: (inout Party) -> Void
}
