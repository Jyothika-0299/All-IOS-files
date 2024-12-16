//
//  ViewController.swift
//  MVVMinSwiftUI
//
//  Created by FCI on 10/12/24.
//

import UIKit

protocol loginViewControllerDelegate {
    
    func getInformationBack (handledString : String?)
    
    func showErrorAlert (errorMessage : String)
    
}

class ViewController: UIViewController, loginViewControllerDelegate {
    
    @IBOutlet weak var textPasswordField: UITextField!
    @IBOutlet weak var textEmailField: UITextField!
    
    let viewModel = LoginViewModel ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // set delegate
        viewModel.delegate = self
        
        textEmailField.attributedPlaceholder = NSAttributedString (string: "Email",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        textPasswordField.attributedPlaceholder = NSAttributedString (string: "Password",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
    }

    
    @IBAction func didTaponLoginButton (
        sender: Any) {
            viewModel.sendValue(from: textEmailField.text, password: textPasswordField.text)
    
            
        }
    
    func getInformationBack (handledString: String?)  {
        
        // handledstring
        
        let alert = UIAlertController(title: "Alert", message: handledString, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction (UIAlertAction (title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func showErrorAlert (errorMessage: String)  {
        
        // Show Error
        
        let alert = UIAlertController (title: "Login", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction (UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        
        present (alert, animated: true, completion: nil)
    }

}

