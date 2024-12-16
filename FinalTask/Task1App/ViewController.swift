//
//  ViewController.swift
//  Task1App
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet var tf1 : UITextField!
    @IBOutlet var tf2 : UITextField!
    @IBOutlet var tf3 : UITextField!
    @IBOutlet var tf4 : UITextField!
    @IBOutlet var tf5 : UITextField!
    @IBOutlet var button1 : UIButton!
    @IBOutlet var button2 : UIButton!
    @IBOutlet var label1 : UILabel!
    var defaults1 : UserDefaults!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
        tf4.delegate = self
        tf5.delegate = self
        
        defaults1 = UserDefaults.standard
        tf1.text = defaults1.string(forKey: "username")
        tf2.text = defaults1.string(forKey: "userpassword")
        tf3.text = defaults1.string(forKey: "useremail")
        tf4.text = defaults1.string(forKey: "userphoneno")
        tf5.text = defaults1.string(forKey: "usercity")
        
        print("\(String(describing:tf1.text!)) \(String(describing:tf2.text!)) \(String(describing:tf3.text!)) \(String(describing:tf4.text!)) \(String(describing:tf2.text!))")
            
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tf1.resignFirstResponder()
        tf2.resignFirstResponder()
        tf3.resignFirstResponder()
        tf4.resignFirstResponder()
        tf5.resignFirstResponder()
    }
    
    
    @IBAction func  button1click() {
        defaults1 = UserDefaults.standard
        defaults1.set(tf1.text,forKey:"username")
        defaults1.set(tf2.text,forKey:"userpassword")
        defaults1.set(tf3.text,forKey:"useremail")
        defaults1.set(tf4.text,forKey:"userphoneno")
        defaults1.set(tf5.text,forKey:"usercity")
        defaults1.synchronize()
       
        
        
    }

    @IBAction func button2Click() {
        //code to save data in user defaults class
        defaults1 = UserDefaults.standard
        defaults1.setValue(tf1.text,forKey:"username")
        defaults1.setValue(tf2.text,forKey:"userpassword")
        defaults1.setValue(tf3.text,forKey:"useremail")
        defaults1.setValue(tf4.text,forKey:"userphoneno")
        defaults1.setValue(tf5.text,forKey:"usercity")
        label1.text = String(describing:tf1.text!+" ") +
        String(describing:tf2.text!+" ") +
        String(describing:tf3.text!+" ") +
        String(describing:tf4.text!+" ") +
        String(describing:tf5.text!+" ")
        
        
    
       
    }
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }

}

