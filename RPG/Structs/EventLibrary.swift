//
//  EventLibrary.swift
//  RPG
//
//  Created by Rylie Castell on 30.04.25.
//

import Foundation

struct EventLibrary {
    static let allEvents = [
        GameEvent(name: "Wandering Merchant",
                  description: "A merchant offers you strange trinkets and potions.",
                  rarity: .common, time: .day,
                  effect: { party in party.coins += 30; print("You gain " + "30 coins".applyConsoleStyles(.yellow) + ".") }),
        
        GameEvent(name: "Broken Cart",
                  description: "You help a traveler fix his cart. In gratitude, he shares supplies.",
                  rarity: .uncommon, time: .day,
                  effect: { party in for hero in party.members { hero.healthPoints = min(hero.maxHealthPoints, hero.healthPoints + 5) }; print("Everyone gains up to " + "5 HP".applyConsoleStyles(.green) + ".") }),

        GameEvent(name: "Ambush!",
                  description: "Bandits spring from the bushes and steal some of your gold!",
                  rarity: .rare, time: .day,
                  effect: { party in party.coins = max(0, party.coins - 40); print("You lose " + "\(party.coins > 0 ? "40" : "all") coins".applyConsoleStyles(.yellow) + "!") }),

        GameEvent(name: "Flower Meadow",
                  description: "You rest in a field of fragrant flowers. The scent soothes your soul.",
                  rarity: .uncommon, time: .day,
                  effect: { party in for hero in party.members { hero.manaPoints = min(hero.maxManaPoints, hero.manaPoints + 3) }; print("Everyone recovers " + "3 MP".applyConsoleStyles(.green) + ".") }),

//       GameEvent(name: "Lost Map",
//                 description: "You find a torn map fragment hinting at a treasure nearby...",
//                 rarity: .rare, time: .day,
//                 effect: { _ in print("This will affect the next area... (placeholder effect)") }),

        GameEvent(name: "Wolves Howling",
                  description: "A pack of wolves circles your camp — you stand guard all night.",
                  rarity: .uncommon, time: .night,
                  effect: { party in for hero in party.members { hero.manaPoints = max(0, hero.manaPoints - 2) }; print("Everyone loses " + "2 MP".applyConsoleStyles(.red) + ".") }),

        GameEvent(name: "Nightmare Vision",
                  description: "A dark dream haunts your sleep, leaving you restless and shaken.",
                  rarity: .rare, time: .night,
                  effect: { party in for hero in party.members { hero.healthPoints = max(1, hero.healthPoints - 4) }; print("Each hero loses " + "4 HP".applyConsoleStyles(.red) + ".") }),

        GameEvent(name: "Shooting Star",
                  description: "You wish upon a shooting star. Magic fills the air.",
                  rarity: .rare, time: .night,
                  effect: { party in party.coins += 100; print("You mysteriously gain " + "100 coins".applyConsoleStyles(.yellow) + "!") }),

        GameEvent(name: "Midnight Visitor",
                  description: "A cloaked figure offers you a gift... but says nothing.",
                  rarity: .uncommon, time: .night,
                  effect: { party in for hero in party.members { hero.attackPower += 1 }; print("Everyone gains " + "+1 attack power".applyConsoleStyles(.cyan) + " permanently.") }),
        
        GameEvent(name: "Ancient Totem",
                  description: "You find an ancient totem pulsing with strange energy.",
                  rarity: .rare, time: .both,
                  effect: { party in for hero in party.members { hero.defense += 2 }; print("All heroes gain " + "+2 defense".applyConsoleStyles(.cyan) + " permanently!") }),

        GameEvent(name: "Wandering Healer",
                  description: "A healer offers free treatment for your wounds.",
                  rarity: .common, time: .both,
                  effect: { party in for hero in party.members {
                      hero.healthPoints = hero.maxHealthPoints
                      hero.manaPoints = hero.maxManaPoints
                  }; print("All heroes " + "fully healed".applyConsoleStyles(.green) + "!") }),

        GameEvent(name: "Goblin Trickster",
                  description: "A goblin steals a random item and vanishes into the bushes.",
                  rarity: .uncommon, time: .both,
                  effect: { party in party.bag.loseRandomItem() })
    ]
}
