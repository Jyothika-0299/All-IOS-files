//
//  ViewController.swift
//  CoreAnimation
//
//  Created by FCI on 28/11/24.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    @IBOutlet var l1 : UILabel!
    @IBOutlet var tf1 : UITextField!
    @IBOutlet var img1 : UIImageView!
    var labelLayer : CALayer!
    var textfieldLayer : CALayer!
    var imageviewLayer : CALayer!
    var screenviewLayer : CALayer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // label layer
        labelLayer = l1.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 30
        labelLayer.backgroundColor = UIColor.yellow.cgColor
        //text field layer
        textfieldLayer = tf1.layer
        textfieldLayer.borderColor = UIColor.white.cgColor
        textfieldLayer.borderWidth = 2
        textfieldLayer.cornerRadius = 13
        textfieldLayer.backgroundColor = UIColor.red.cgColor
        //img layer
        imageviewLayer = img1.layer
        imageviewLayer.borderColor = UIColor.purple.cgColor
        imageviewLayer.borderWidth = 10
        imageviewLayer.cornerRadius = 25
        imageviewLayer.shadowRadius = 100
        imageviewLayer.shadowColor = UIColor.black.cgColor
        imageviewLayer.backgroundColor = UIColor.blue.cgColor
        //screen view layer
        screenviewLayer = self.view.layer
        screenviewLayer.borderColor = UIColor.orange.cgColor
        screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
    }
}



