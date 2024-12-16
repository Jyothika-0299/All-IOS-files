//
//  ViewController.swift
//  TextfieldlabelbuttoncodingApp
//
//  Created by FCI on 21/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var tf1: UITextField!
    var label1: UILabel!
    var b1 : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayUI()
        // Do any additional setup after loading the view.
    }
    
    func displayUI() {
        self.view.backgroundColor = .purple
        //text field code
        tf1 = UITextField()
        tf1.frame = CGRect(x: 40, y: 150, width: 280, height: 34)
        tf1.placeholder = "Enter text"
        tf1.textColor = .black
        tf1.backgroundColor = .yellow
        tf1.returnKeyType = .done
        tf1.keyboardType = .emailAddress
        tf1.isSecureTextEntry = true
        tf1.textAlignment = .center
        self.view.addSubview(tf1)
        //label code
        label1 = UILabel()
        label1.frame = CGRect(x: 50, y: 250, width: 350, height: 44)
        label1.backgroundColor = .black
        label1.textColor = .blue
        label1.textAlignment = .center
        label1.numberOfLines = 3
        self.view.addSubview(label1)
        //button code
        b1 = UIButton()
        b1.frame = CGRect(x: 60, y: 350, width: 450, height: 55)
        b1.setTitle("CLICK HERE", for: .normal)
        b1.setTitleColor(.black, for: .normal)
        b1.backgroundColor = .red
        b1.addTarget(self, action: #selector(click1), for: .touchUpInside)
        self.view.addSubview(b1)
        
        
    }
    @objc func click1() {
        label1.text = tf1.text
    }



}

