//
//  LoginViewModel.swift
//  MVVMinSwiftUI
//
//  Created by FCI on 10/12/24.
//

import Foundation

protocol loginViewModelDelegate {
    // This function is going to use for transferring the data from controller to viewmodel
func sendValue (from email:String?, password:String?)

}

class LoginViewModel: loginViewModelDelegate {
   
    // LoginViewModel implementation
    var delegate: loginViewControllerDelegate?
    
    // set a call back to viewcontroller
    func sendValue (from email: String?, password: String?) {
    
    
        guard let emailTextfield = email else {return}
        guard let passTextfield = password else {return}
    
        
        if emailTextfield.isValidEmail(){
            delegate?.getInformationBack(handledString: "Login Sucessfull \(passTextfield)\(emailTextfield)")
        }
        else {
            delegate?.showErrorAlert(errorMessage: "Enter Valid Email And Password")
        }
        
                                             
    }
    
    
    
}




