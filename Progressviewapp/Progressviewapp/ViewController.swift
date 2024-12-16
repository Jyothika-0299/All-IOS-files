//
//  ViewController.swift
//  Progressviewapp
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pv1 : UIProgressView!
    var timer1 : Timer!
    var pv2 : UIProgressView!
    var timer2 : Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayProgressView()
        
        timer1 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress1), userInfo: nil, repeats: true)
    }
    @objc func updateProgress1() {
        pv1.progress += 0.7
        if pv1.progress == 1.0 {
            pv1.isHidden = true
            self.view.backgroundColor = .red
            timer1.invalidate()
        }
        
        
    }
    
    func displayProgressView() {
        pv2 = UIProgressView()
        pv2.frame = CGRect(x: 30, y: 350, width: 300, height: 40)
        pv2.progress = 0
        pv2.progressViewStyle = .bar
        pv2.trackTintColor = .white
        pv2.progressTintColor = .blue
        self.pv1.addSubview(pv2)
        timer2 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(updateProgress2), userInfo: nil, repeats: true)
        
        
    }
    @objc func updateProgress2() {
        pv2.progress += 0.8
        if pv2.progress == 1.0 {
            pv2.isHidden = true
            self.view.backgroundColor = .purple
            timer2.invalidate()
        }
        
    }
}

