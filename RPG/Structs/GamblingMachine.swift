//
//  GamblingMachine.swift
//  RPG
//
//  Created by Rylie Castell on 07.05.25.
//

import Foundation

struct GamblingMachine {
    var currentJackpot: Int = 100
    
    mutating func menu(_ party: Party, statusBar: StatusBar) {
        print(statusBar)
        print("There is a gambling machine in the corner of the room. You can play Rock, Paper, Scissors there to win money!\nOne game costs " + "50 coins".applyConsoleStyles(.yellow) + ". You can win " + "100 coins".applyConsoleStyles(.yellow) + ".\nDo you want to play?")
        if confirmation() {
            if party.spendCoins(50) {
                waitForPlayerContinue()
                clearConsole()
                play(party)
                currentJackpot = 100
                menu(party, statusBar: statusBar)
            } else {
                waitForPlayerContinue()
                clearConsole()
            }
        } else {
            clearConsole()
        }
    }
    
    mutating func play(_ party: Party) {
        var gameRound: Int = 0
        var gameIsRunning = true
        while gameIsRunning {
            gameRound += 1
            let roundBanner = "Round \(gameRound)".highlight()
            let result = calculateResult(roundBanner)
            if result == .win {
                print("\n" + "Win!".applyConsoleStyles(.bold) + " You won " + "\(currentJackpot) coins".applyConsoleStyles(.yellow) + ".\n\nDo you want to play again and double the jackpot and win " + "\(currentJackpot * 2) coins".applyConsoleStyles(.yellow) + "?\nIf you lose you will lose all previously won coins, but you can stop anytime.")
                if confirmation() {
                    self.currentJackpot = currentJackpot * 2
                    clearConsole()
                } else {
                    party.earnCoins(currentJackpot)
                    print("\n" + "\(currentJackpot) coins".applyConsoleStyles(.yellow) + " have been added to your bag.")
                    waitForPlayerContinue()
                    clearConsole()
                    gameIsRunning = false
                }
            } else {
                print("\n" + "Lose!".applyConsoleStyles(.bold) + " Sorry, better luck next time!")
                waitForPlayerContinue()
                clearConsole()
                gameIsRunning = false
            }
        }
    }
    
    func chooseMove() -> GameMove {
        print("Choose a move.")
        print("[" + "1".applyConsoleStyles(.bold) + "] Rock")
        print("[" + "2".applyConsoleStyles(.bold) + "] Paper")
        print("[" + "3".applyConsoleStyles(.bold) + "] Scissors")
        let moveNumber = enterInteger(max: 3)
        if moveNumber == 1 {
            return .rock
        } else if moveNumber == 2 {
            return .paper
        } else {
            return .scissors
        }
    }
    
    func calculateResult(_ roundBanner: String) -> GameResult {
        print(roundBanner)
        let playerMove = chooseMove()
        let machineMove = GameMove.allCases.randomElement()!
        clearConsole()
        print(roundBanner)
        print("\nRock ...")
        sleep(1)
        print("\n... Paper ...")
        sleep(1)
        print("\n... Scissors!")
        sleep(1)
        waitForPlayerContinue()
        clearConsole()
        print("\nMachine: \(machineMove.rawValue.applyConsoleStyles(.cyan))\nYou: \(playerMove.rawValue.applyConsoleStyles(.green))")
        let result = playerMove.outcome(against: machineMove)
        if result == .draw {
            print("\nDraw!\nTry again!")
            waitForPlayerContinue()
            clearConsole()
            return calculateResult(roundBanner)
        } else {
            return result
        }
    }
}
