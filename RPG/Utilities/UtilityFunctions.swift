//
//  UtilityFunctions.swift
//  RPG
//
//  Created by Rylie Castell on 25.04.25.
//

import Foundation

func enterInteger(min: Int, max: Int) -> Int {
    print("\nPlease enter the number of your choice.")
    var input: Int? = Int(readLine()!)
    while input == nil || input! < min || input! > max {
        print("Wrong input. Please try again.")
        input = Int(readLine()!)
    }
    return input!
}

func confirmation() -> Bool {
    print("(y/n)")
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
