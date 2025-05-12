//
//  GameIntro.swift
//  RPG
//
//  Created by Rylie Castell on 12.05.25.
//

import Foundation

struct GameIntro {
    let titleArt: String = """
                     ░▒▓███████▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░          
                    ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░  ░▒▓█▓▒░                 
                    ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░  ░▒▓█▓▒░                 
                     ░▒▓██████▓▒░░▒▓███████▓▒░░▒▓█▓▒░▒▓███████▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓██████▓▒░           
                           ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░         ░▒▓█▓▒░          
                           ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░         ░▒▓█▓▒░          
                    ░▒▓███████▓▒░░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░  ░▒▓███████▓▒░           
                                                                                                           
                                                                                                           
                                             ░▒▓██████▓▒░░▒▓████████▓▒░                                    
                                            ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░                                           
                                            ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░                                           
                                            ░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░                                      
                                            ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░                                           
                                            ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░                                           
                                             ░▒▓██████▓▒░░▒▓█▓▒░                                           
                                                                                                           
                                                                                                           
        ░▒▓████████▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓████████▓▒░▒▓███████▓▒░░▒▓███████▓▒░░▒▓█▓▒░░▒▓███████▓▒░ 
           ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        
           ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░        
           ░▒▓█▓▒░   ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░ ░▒▓███████▓▒░░▒▓███████▓▒░░▒▓█▓▒░░▒▓██████▓▒░  
           ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░ 
           ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░ 
           ░▒▓█▓▒░   ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓███████▓▒░  
        """
    let prologueText: String = """
        In the beginning, there was balance.

        Light and shadow danced in harmony,
        watched over by ancient spirits —  
        each bound to a sacred animal mask.

        These masks were more than symbols.  
        They were power. Purpose. Memory.

        For centuries, the masked ones guarded Tenebris —  
        a realm veiled in mist, hidden from the waking world.  
        They whispered through trees, stirred the rivers, shaped the dreams of mortals.

        But balance is fragile.

        One by one, the masks fell silent.

        Corrupted. Forgotten. Stolen.

        Now, darkness spreads like rot through the roots of the world.  
        The spirits are fading. The last light flickers.

        …

        “…wake up…”

        Someone calls you.  
        Urgent. Near. Inevitable.

        “Wake up! Tenebris needs you!”
        """
    
    func showTitle() {
        titleArt.printSlowlyByLine(delay: 400000)
    }
    
    func showPrologue() {
        prologueText.printSlowlyByLine()
    }
    
    func play() {
        print("Press " + "[Enter]".applyConsoleStyles(.bold) + " to start")
        _ = readLine()
        clearConsole()
        showTitle()
        waitForPlayerContinue()
        clearConsole()
        showPrologue()
        waitForPlayerContinue()
        clearConsole()
    }
}
