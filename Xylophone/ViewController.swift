//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player = AVAudioPlayer()
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        playKeyAudio(key: sender.currentTitle ?? "X")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            sender.alpha = 1
        }
    }
    
    func playKeyAudio(key: String, ext: String = "wav") {
        if let soundURL = Bundle.main.url(forResource: key, withExtension: ext) {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                player.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
}

