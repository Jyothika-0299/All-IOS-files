//
//  ViewController.swift
//  UserDefaultsApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var userName : UITextField!
    @IBOutlet var password : UITextField!
    @IBOutlet var saveButton : UIButton!
    var defaults1 : UserDefaults!//foundation framework

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // code to retrive infromation from user defaults class
        defaults1 = UserDefaults.standard
        userName.text = defaults1.string(forKey: "username")
        password.text = defaults1.string(forKey: "userpassword")
        print("\(String(describing:userName.text!)) \(String(describing:password.text!))")
    }
    @IBAction func saveButtonClick() {
        //code to save data in user defaults class
        defaults1 = UserDefaults.standard
        defaults1.setValue(userName.text, forKey: "username")
        defaults1.setValue(password.text, forKey: "userpassword")
        defaults1.synchronize()
        
        
    }


}

