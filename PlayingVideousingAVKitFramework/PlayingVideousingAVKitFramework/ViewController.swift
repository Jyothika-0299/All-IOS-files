//
//  ViewController.swift
//  PlayingVideousingAVKitFramework
//
//  Created by FCI on 28/11/24.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    @IBOutlet var b1 : UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func b1Click() {
        let videoURL = URL(string:"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4" )
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController,animated: true)
        playerViewController.player!.play()
    }
}

