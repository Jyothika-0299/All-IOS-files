//
//  ViewController.swift
//  JyothikaFinalProject
//
//  Created by FCI on 11/12/24.
//



// Imports the UIKit framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import QuartzCore

// Defines a ViewController class that manages the app's user interface.
class ViewController: UIViewController {
    // Connects below different UIObjects from the storyboard to this code.
    @IBOutlet var image : UIImageView!
    @IBOutlet var bookingButton : UIButton!
    @IBOutlet var locationButton : UIButton!
    //core animation
    var Button : CALayer!
    var imageviewLayer : CALayer!
    var screenviewLayer : CALayer!
    
    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //core animation for imageview
        imageviewLayer = image.layer
        imageviewLayer.borderColor = UIColor.black.cgColor
        imageviewLayer.borderWidth = 5
        imageviewLayer.cornerRadius = 25
        imageviewLayer.shadowRadius = 100
        imageviewLayer.shadowColor = UIColor.black.cgColor
        //core animation for booking button
        Button = bookingButton.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 20
        //Button.backgroundColor = UIColor.yellow.cgColor
        //core animation for location button
        Button = locationButton.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 20
        //Button.backgroundColor = UIColor.yellow.cgColor
        //core animation for screen view layer
        screenviewLayer = self.view.layer
        //screenviewLayer.borderColor = UIColor.systemPink.cgColor
        //screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        
    }
    // Defines an action triggered when the button is tapped.
    @IBAction func bookingButtonClick() {
    }
    // Defines an action triggered when the button is tapped.
    @IBAction func locationButtonClick() {
    }
}

