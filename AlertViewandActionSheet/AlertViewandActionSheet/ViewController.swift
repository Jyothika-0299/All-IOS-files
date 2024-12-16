//
//  ViewController.swift
//  AlertViewandActionSheet
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var b1 : UIButton!
    @IBOutlet var b2 : UIButton!
    @IBOutlet var b3 : UIButton!
    @IBOutlet var b4 : UIButton!
    @IBOutlet var b5 : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func b1Click() {
        let alert = UIAlertController(title: "Sign out", message: "sign back to access", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: { _ in
            print("cancel button clicked..!")
        }))
        alert.addAction(UIAlertAction(title: "Signout", style: .default, handler: {(_:UIAlertAction!) in
        }))
        //display alert
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func b2Click() {
        let alert = UIAlertController(title: "Sign out", message: "sign back to access", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: { _ in
            print("cancel button clicked..!")
        }))
        alert.addAction(UIAlertAction(title: "Signout", style: .destructive, handler: {(_:UIAlertAction!) in
        }))
        //display alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    @IBAction func b3Click() {
        let alert = UIAlertController(title: "Alert", message: "sign back to access", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "cancel", style: .default, handler: { _ in
            print("cancel button clicked..!")
        }))
        alert.addAction(UIAlertAction(title: "Signout", style: .default, handler: {(_:UIAlertAction!) in
        }))
        //display alert
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func b4Click() {
        let alertController = UIAlertController(title: "Sign out", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title : "Add",style : .default) { (_)  in          if let txtField = alertController.textFields?.first,
             let text = txtField.text {
            print("Text==>" + text)
            }
        }
        alertController.addAction(confirmAction)
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (_) in }
        alertController.addTextField{ (textField) in
            textField.placeholder = "Tag"
        }
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func b5Click() {
        let alert = UIAlertController(title: "Title", message: "please select an option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "approve", style: .default, handler: { _ in
            print("user clicked approve button..!")
        }))
        alert.addAction(UIAlertAction(title: "edit", style: .default, handler: { _ in
            print("user clicked edit button..!")
        }))
        alert.addAction(UIAlertAction(title: "delete", style: .destructive, handler: { _ in
            print("user clicked delete button..!")
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {(_) in print("User click dismiss button")
        }))
        //display alert
        self.present(alert, animated: true, completion: nil)
        print("completion block")
        
    }
}

