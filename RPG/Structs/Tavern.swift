//
//  Tavern.swift
//  RPG
//
//  Created by Rylie Castell on 29.04.25.
//

import Foundation

struct Tavern {
    let shop: Shop = Shop(type: .tavern)
    
    func menu(_ party: Party, statusBar: StatusBar) {
        print(statusBar)
        print("\nWelcome to the Tavern. What do you want to do?")
        print("\n[" + "1".applyConsoleStyles(.bold) + "] - Visit Tavern Shop")
        print("\n[" + "2".applyConsoleStyles(.bold) + "] - Swap party members")
        print("\n[" + "3".applyConsoleStyles(.bold) + "] - Play with Gambling Machine")
        print("\n[" + "4".applyConsoleStyles(.bold) + "] - Go to sleep")
        let chosenOption = enterInteger(max: 4)
        clearConsole()
        if chosenOption == 1 {
            shop.menu(party, statusBar: statusBar)
            clearConsole()
            menu(party, statusBar: statusBar)
        }
        if chosenOption == 2 {
            if party.reserve.count == 0 {
                print(statusBar)
                print("\nThere are no heroes to swap the party members with yet. Keep exploring the world to meet them!")
                waitForPlayerContinue()
                clearConsole()
                menu(party, statusBar: statusBar)
            } else {
                party.chooseSwapMenu(statusBar: statusBar)
                waitForPlayerContinue()
                clearConsole()
                menu(party, statusBar: statusBar)
            }
        }
        if chosenOption == 3 {
            var gamblingMachine = GamblingMachine()
            gamblingMachine.menu(party, statusBar: statusBar)
            menu(party, statusBar: statusBar)
        }
        if chosenOption == 4 {
            party.healMembers()
        }
    }
}
