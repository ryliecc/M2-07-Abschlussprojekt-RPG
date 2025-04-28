//
//  Party.swift
//  RPG
//
//  Created by Rylie Castell on 28.04.25.
//

import Foundation

class Party {
    var members: [Hero]
    var reserve: [Hero]
    var coins: Int = 0
    var bag: Bag = Bag(items: [])
    var isAbleToFight: Bool { members.contains { $0.isAlive }}
    
    init(initialHeroes: [Hero], reserve: [Hero] = []) {
        self.members = initialHeroes
        self.reserve = reserve
    }
    
    func addMember(_ hero: Hero) {
        members.append(hero)
    }
    
    func removeMember(_ name: String) {
        if let index = members.firstIndex(where: { $0.name == name }) {
            members.remove(at: index)
        }
    }
    
    func swapMember(activeName: String, reserveName: String) {
        if let activeMemberIndex = members.firstIndex(where: { $0.name == activeName }),
           let reserveMemberIndex = reserve.firstIndex(where: { $0.name == reserveName}) {
            let activeHero = members[activeMemberIndex]
            let reserveHero = reserve[reserveMemberIndex]
            members[activeMemberIndex] = reserveHero
            reserve[reserveMemberIndex] = activeHero
            print("\(activeName) was replaced by \(reserveName).")
        }
    }
    
    func addItem(_ item: Item) {
        bag.addItem(item)
    }
    
    func removeItem(_ item: Item) {
        if let itemIndex = bag.items.firstIndex(where: { $0.name == item.name }) {
            bag.items.remove(at: itemIndex)
        }
    }
    
    func spendCoins(_ amount: Int) -> Bool {
        if coins >= amount {
            coins -= amount
            return true
        }
        return false
    }
    
    func earnCoins(_ amount: Int) {
        coins += amount
    }
}
