//
//  ViewController.swift
//  KeyBoardHidingApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var tf1 : UITextField!
    @IBOutlet var tf2 : UITextField!
    @IBOutlet var tf3 : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //setting delegates
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tf1.resignFirstResponder()
        tf2.resignFirstResponder()
        tf3.resignFirstResponder()
    }
    
    // when user click return button in text field keyboard
    
    func textFieldShouldReturn(_ textField : UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }


}

