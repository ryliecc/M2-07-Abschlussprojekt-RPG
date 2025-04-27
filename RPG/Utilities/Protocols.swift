//
//  Protocols.swift
//  RPG
//
//  Created by Rylie Castell on 22.04.25.
//

import Foundation

protocol Levelable {
    var experiencePoints: Int { get set }
    var level: Int { get set }
    var experienceNeededForNextLevel: Int { get }
    
    mutating func gainExperience(_ amount: Int)
    mutating func levelUp()
}

protocol BossDelegate: AnyObject {
    func bossCalledHenchman()
}
