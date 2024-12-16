//
//  LocationViewController.swift
//  JyothikaFinalProject
//
//  Created by FCI on 12/12/24.
//


// Imports the UIKit framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import QuartzCore
// Defines a ViewController class that manages the app's user interface.
class LocationViewController: UIViewController {
    @IBOutlet var image : UIImageView!
    @IBOutlet var StaticButton : UIButton!
    @IBOutlet var CurrentButton : UIButton!
    //core animation
    var Button : CALayer!
    var imageviewLayer : CALayer!
    var screenviewLayer : CALayer!
    
    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        //core animation for imageview
        imageviewLayer = image.layer
        imageviewLayer.borderColor = UIColor.black.cgColor
        imageviewLayer.borderWidth = 5
        imageviewLayer.cornerRadius = 25
        imageviewLayer.shadowRadius = 100
        imageviewLayer.shadowColor = UIColor.black.cgColor
        //core animation for static button
        Button = StaticButton.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 5
        //Button.backgroundColor = UIColor.yellow.cgColor
        //core animation for current location button
        Button = CurrentButton.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 5
        //core animation for screen view layer
        screenviewLayer = self.view.layer
        //screenviewLayer.borderColor = UIColor.systemPink.cgColor
        //screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        // Do any additional setup after loading the view.
    }
    
    // Defines an action triggered when the button is tapped.
    @IBAction func StaticButtonClick() {
        //let location1 = StaticViewController()
        //navigationController?.pushViewController(location1, animated: true)
    }
    // Defines an action triggered when the button is tapped.
    @IBAction func CurrentButtonClick() {
        //let location2 = CurrentViewController()
        //navigationController?.pushViewController(location2, animated: true)
    }
}
