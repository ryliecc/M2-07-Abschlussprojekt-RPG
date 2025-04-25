//
//  UtilityFunctions.swift
//  RPG
//
//  Created by Rylie Castell on 25.04.25.
//

import Foundation

func enterInteger(min: Int, max: Int) -> Int {
    print("Please enter the number of your choice.")
    var input: Int? = Int(readLine()!)
    while input == nil || input! < min || input! > max {
        print("Wrong input. Please try again.")
        input = Int(readLine()!)
    }
    return input!
}
