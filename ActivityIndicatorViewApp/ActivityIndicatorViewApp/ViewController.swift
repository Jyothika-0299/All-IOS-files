//
//  ViewController.swift
//  ActivityIndicatorViewApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var  av1 : UIActivityIndicatorView!
    var timer1 : Timer!
    
    var av2 : UIActivityIndicatorView!
    var timer2 : Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayActivityIndicatorView()
        av1.startAnimating()
        timer1 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(stopTimer1), userInfo: nil, repeats: false)
    }
    
    @objc func stopTimer1() {
        av1.stopAnimating()
        av1.hidesWhenStopped = true
        self.view.backgroundColor = .orange
    }
    
    func displayActivityIndicatorView() {
        av2 = UIActivityIndicatorView()
        av2.frame = CGRect(x: 30, y: 500, width: 50, height: 40)
        av2.style = .large
        av2.color = .purple
        av2.startAnimating()
        self.view.addSubview(av2)
        timer2 = Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(stopTimer2), userInfo: nil, repeats: false)
    
        
        
    }
    @objc func stopTimer2() {
        av2.stopAnimating()
        av2.hidesWhenStopped = true
        self.view.backgroundColor = .red
        
    }
    


}

