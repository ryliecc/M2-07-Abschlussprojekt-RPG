//
//  SoundManager.swift
//  RPG
//
//  Created by Rylie Castell on 06.05.25.
//

import Foundation
import AVFAudio

class SoundManager {
    static let shared = SoundManager()
    
    private var audioPlayer: AVAudioPlayer?
    
    func playSound(path: String) {
        let fileManager = FileManager.default
        let currentDirectory = fileManager.currentDirectoryPath + "/Projekte/02-07-abschlussprojekt-rpg-ryliecc"
        // ACHTUNG! Das ist kein dynamischer Pfad und funktioniert deswegen nur auf meinem Macbook. Wie man einen dynamischen Pfad verwendet konnten die Dozenten mir leider nicht sagen.
        let fullPath = currentDirectory + path
        let url = URL(fileURLWithPath: fullPath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        }
        catch {
            print("Fehler beim Abspielen des Sounds: \(error) --\(error.localizedDescription)")
        }
    }

}
