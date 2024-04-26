//
//  SoundManager.swift

//  Created by Rahaf on 25/12/2023.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()  
    private var audioPlayer: AVAudioPlayer?

    private init() {}

    func playSound(soundName: String, volume: Float, extensionS: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: extensionS ) else {
            print("Sound file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            audioPlayer?.volume = volume
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}

