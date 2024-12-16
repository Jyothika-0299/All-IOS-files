//
//  ViewController.swift
//  PlayingAudioFileusingAVFoundationFramework
//
//  Created by FCI on 27/11/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var tb1 : UIToolbar!
    @IBOutlet var play : UIBarButtonItem!
    @IBOutlet var pause : UIBarButtonItem!
    @IBOutlet var stop : UIBarButtonItem!
    var player : AVAudioPlayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func playClick() {
        guard let path = Bundle.main.path(forResource: "song", ofType: "mp3")
        else {
            return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    @IBAction func pauseClick() {
        player.pause()
        
    }
    @IBAction func stopClick() {
        player.stop()
        
        
    }


}

