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
        print("Welcome to the Tavern. What do you want to do?")
        print("[1] - Visit Tavern Shop")
        print("[2] - Swap party members")
        print("[3] - Play with Gambling Machine")
        print("[4] - Go to sleep")
        print("Please enter the number of your choice.")
        let chosenOption = enterInteger(min: 1, max: 4)
        if chosenOption == 1 {
            shop.menu(party)
        }
        if chosenOption == 2 {
            if party.reserve.count == 0 {
                print("There are no heroes to swap the party members with yet. Keep exploring the world to meet them!")
                menu(party)
            } else {
                party.chooseSwapMenu()
            }
        }
        if chosenOption == 3 {
            print("There is a little sign dangling on the gambling machine: OUT OF ORDER!")
            menu(party)
        }
        if chosenOption == 4 {
            party.healMembers()
        }
    }
}
