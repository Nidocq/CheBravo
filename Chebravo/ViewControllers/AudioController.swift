//
//  AudioController.swift
//  Chebravo
//
//  Created by Phillip Lundin on 12/08/2022.
//

import Foundation
import AVKit

///<summary> Plays audio for views</summary>
class AudioController {
    var player: AVAudioPlayer!
    
    func playAudio(name: String) {
        if let url = Bundle.main.url(forResource: name, withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("error")
            }
        } else {
            print("No sound to be found")
        }
            

    }
}
