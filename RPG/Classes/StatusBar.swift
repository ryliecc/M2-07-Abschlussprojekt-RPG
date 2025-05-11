//
//  StatusBar.swift
//  RPG
//
//  Created by Rylie Castell on 11.05.25.
//

import Foundation

class StatusBar: CustomStringConvertible {
    
    var dayTime: TimeOfDay
    var coins: Int {
        party.coins
    }
    var party: Party
    
    var healthStatuses: [String:HealthStatus] {
        var dictionary: [String:HealthStatus] = [:]
        for hero in party.members {
            if hero.isAlive {
                let percentage = hero.healthPoints / hero.maxHealthPoints
                switch percentage {
                case ..<0.3:
                    dictionary[hero.name] = .critical
                case ..<0.6:
                    dictionary[hero.name] = .injured
                default:
                    dictionary[hero.name] = .healthy
                }
            } else {
                dictionary[hero.name] = .dead
            }
        }
        return dictionary
    }
    
    var description: String {
        var heroSymbols: String = ""
        for healthStatus in healthStatuses {
            let letter = String(healthStatus.key.prefix(1).uppercased())
            var symbol = "[\(letter)] "
            switch healthStatus.value {
            case .healthy:
                symbol = symbol.applyConsoleStyles(.green)
            case .injured:
                symbol = symbol.applyConsoleStyles(.yellow)
            case .critical:
                symbol = symbol.applyConsoleStyles(.red)
            case .dead:
                symbol = symbol.applyConsoleStyles(.grey)
            }
            heroSymbols += symbol
        }
        
        var dayTimeIndicator: String {
            switch dayTime {
            case .day:
                "☀ Day Time ☁"
            case .night:
                "☽ Night Time ☾"
            }
        }
        
        let coinIndicator: String = "Coins: " + String(coins).applyConsoleStyles(.yellow)
        return "\(heroSymbols)     \(dayTimeIndicator)      \(coinIndicator)".frame(padding: 4)
    }
    
    init(dayTime: TimeOfDay, party: Party) {
        self.dayTime = dayTime
        self.party = party
    }
}
