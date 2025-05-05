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
        let url = URL(fileURLWithPath: path)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        catch {
            print("Fehler beim Abspielen des Sounds: \(error) --\(error.localizedDescription)")
        }
    }

}
