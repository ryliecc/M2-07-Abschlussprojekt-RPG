//
//  UtilityFunctions.swift
//  RPG
//
//  Created by Rylie Castell on 25.04.25.
//

import Foundation

func enterInteger(max: Int) -> Int {
    print("\nPlease enter the number of your choice.")
    var input: Int? = Int(readLine()!)
    while input == nil || input! < 1 || input! > max {
        print("Wrong input. Please try again.")
        input = Int(readLine()!)
    }
    return input!
}

func confirmation() -> Bool {
    print("\n(y/n)")
    var input = readLine()!
    while input != "y" && input != "n" {
        print("Wrong input. Please try again.")
        input = readLine()!
    }
    if input == "y" {
        return true
    } else {
        return false
    }
}

func waitForPlayerContinue() {
    print("\nPress [\("Enter".applyConsoleStyles(.bold))] to continue.")
    _ = readLine()
}

func clearConsole() {
    print("\u{001B}[2J")
    print("\u{001B}[H")
}
