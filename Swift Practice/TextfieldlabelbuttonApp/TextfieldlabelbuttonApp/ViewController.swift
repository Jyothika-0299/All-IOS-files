//
//  ViewController.swift
//  TextfieldlabelbuttonApp
//
//  Created by FCI on 21/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tf1: UITextField!
    @IBOutlet var label1: UILabel!
    @IBOutlet var button1: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func click1() {
        label1.text = tf1.text
        
    }

}

