//
//  ViewController.swift
//  switchApp
//
//  Created by FCI on 21/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sw1 : UISwitch!
    var sw2 : UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //switch code
        sw2 = UISwitch()
        sw2.frame = CGRect(x : 100, y : 450, width : 100, height : 50)
        sw2.isOn = false
        sw2.onTintColor = .green
        sw2.thumbTintColor = .black
        sw2.addTarget(self, action: #selector(switchClick2), for: .valueChanged)
        self.view.addSubview(sw2)
        
    }
    @IBAction func switchClick1() {
        
        if sw1.isOn {
            self.view.backgroundColor = .orange
            print("Switch is ON")
        }
        else {
            self.view.backgroundColor = .white
            print("Switch is OFF")
        }
        
    }
    
   
    
    @objc func switchClick2() {
        if sw2.isOn {
            self.view.backgroundColor = .purple
            print("Switch on")
        }
        else {
            self.view.backgroundColor = .purple
            print("Switch off")
            
        }
    }


}

