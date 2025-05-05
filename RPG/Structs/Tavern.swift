//
//  Tavern.swift
//  RPG
//
//  Created by Rylie Castell on 29.04.25.
//

import Foundation

struct Tavern {
    let shop: Shop = Shop(type: .tavern)
    
    func menu(_ party: Party) {
        print("\nWelcome to the Tavern. What do you want to do?")
        print("[1] - Visit Tavern Shop")
        print("[2] - Swap party members")
        print("[3] - Play with Gambling Machine")
        print("[4] - Go to sleep")
        let chosenOption = enterInteger(max: 4)
        if chosenOption == 1 {
            shop.menu(party)
            menu(party)
        }
        if chosenOption == 2 {
            if party.reserve.count == 0 {
                print("\nThere are no heroes to swap the party members with yet. Keep exploring the world to meet them!")
                menu(party)
            } else {
                party.chooseSwapMenu()
                menu(party)
            }
        }
        if chosenOption == 3 {
            print("\nThere is a little sign dangling on the gambling machine: OUT OF ORDER!")
            menu(party)
        }
        if chosenOption == 4 {
            party.healMembers()
        }
    }
}
