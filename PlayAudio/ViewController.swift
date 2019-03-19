//
//  ViewController.swift
//  PlayAudio
//
//  Created by Ashwani Sharma on 19/03/19.
//  Copyright © 2019 Beero. All rights reserved.
//

import UIKit
import AVFoundation



class ViewController: UIViewController,AVAudioPlayerDelegate {
    var playerAudio: AVAudioPlayer?

    fileprivate var timer = Timer()
    fileprivate var player: AVAudioPlayer = AVAudioPlayer()
    fileprivate var currentStateAudio = "first"
    fileprivate var oldAudio = String()
    fileprivate var soundList: [String]!
    fileprivate var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        soundList = ["first","second","thrid","fourth","fifth","sixth","seven"]
        startTimer()
    }
    
    //MARK: Play Audio File.
    func startTimer() {
//        if (oldAudio != self.currentStateAudio)
//        {
            guard let fileURL = Bundle.main.url(forResource: self.currentStateAudio, withExtension: "mp3") else { return }
            do {
                 player = try AVAudioPlayer(contentsOf: fileURL, fileTypeHint: AVFileType.mp3.rawValue)
            } catch {
                print("error")
            }
            player.delegate = self
            player.play()
//            oldAudio = self.currentStateAudio
//        }
    }
    //MARK: Audio Finish Delegate Call.
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool)
    {
        print("Finished Playing")
        index = index + 1
        if index > soundList.count { return }
        currentStateAudio = soundList[index]
        print(currentStateAudio)
        self.startTimer()
    }
    
    //MARK: Stop Fuction Call.
    func stopAudio(){
        if playerAudio != nil {
            playerAudio?.stop()
            playerAudio = nil
        }
    }
    
}




