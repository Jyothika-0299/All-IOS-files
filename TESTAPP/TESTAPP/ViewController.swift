//
//  ViewController.swift
//  TESTAPP
//
//  Created by FCI on 23/11/24.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet var Txt1: UITextField!
    @IBOutlet var Txt2: UITextField!
    @IBOutlet var Txt3: UITextField!
    @IBOutlet var Txt4: UITextField!
    @IBOutlet var Txt5: UITextField!
    @IBOutlet var save: UIButton!
    @IBOutlet var submit: UIButton!
    @IBOutlet var register: UILabel!
    @IBOutlet var label: UILabel!
    
    var defaults1: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Txt1.delegate = self
        Txt2.delegate = self
        Txt3.delegate = self
        Txt4.delegate = self
        Txt5.delegate = self
        
        defaults1 = UserDefaults.standard
        Txt1.text = defaults1.string(forKey: "username")
        Txt2.text = defaults1.string(forKey: "userpassword")
        Txt3.text = defaults1.string(forKey: "useremail")
        Txt4.text = defaults1.string(forKey: "userphoneNumber")
        Txt5.text = defaults1.string(forKey: "usercity")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Txt1.resignFirstResponder()
        Txt2.resignFirstResponder()
        Txt3.resignFirstResponder()
        Txt4.resignFirstResponder()
        Txt5.resignFirstResponder()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func SaveClick(){
        
        defaults1 = UserDefaults.standard
        defaults1.set(Txt1.text, forKey: "username")
        defaults1.set(Txt2.text, forKey: "userpassword")
        defaults1.set(Txt3.text, forKey: "useremail")
        defaults1.set(Txt4.text, forKey: "userphoneNumber")
        defaults1.set(Txt5.text, forKey: "usercity")
        defaults1.synchronize()
    }
    @IBAction func SubmitClick(){
        
        
        label.text=String(describing:Txt1.text!+" ") +
        String(describing:Txt2.text!+" ") +
        String(describing:Txt3.text!+" ") +
        String(describing:Txt4.text!+" ") +
        String(describing:Txt5.text!+" ")
        
        
        
    }
                     

}
