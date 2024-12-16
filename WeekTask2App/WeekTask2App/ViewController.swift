//
//  ViewController.swift
//  WeekTask2App
//
//  Created by FCI on 24/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var  av1 : UIActivityIndicatorView!
       var timer1 : Timer!
    @IBOutlet var img1 : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        img1.isHidden = true
        av1.startAnimating()
        timer1 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(stopTimer1), userInfo: nil, repeats: false)
    }
    @objc func stopTimer1() {
        av1.stopAnimating()
        av1.hidesWhenStopped = true
        self.img1.isHidden = false
        self.img1.image = UIImage(named: "nature.jpeg")
        self.view.backgroundColor = .orange
       }


}

