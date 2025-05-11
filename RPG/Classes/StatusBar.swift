//
//  StatusBar.swift
//  RPG
//
//  Created by Rylie Castell on 11.05.25.
//

import Foundation

class StatusBar: CustomStringConvertible {
    
    var dayTime: TimeOfDay
    var coins: Int
    var party: [Hero]
    
    var healthStatuses: [String:HealthStatus] {
        var dictionary: [String:HealthStatus] = [:]
        for hero in party {
            if hero.isAlive {
                let percentage = hero.maxHealthPoints / hero.healthPoints
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
        ""
    }
    
    init(dayTime: TimeOfDay, coins: Int, party: [Hero]) {
        self.dayTime = dayTime
        self.coins = coins
        self.party = party
    }
}
