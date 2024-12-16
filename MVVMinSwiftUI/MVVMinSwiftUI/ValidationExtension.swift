//
//  ValidationExtension.swift
//  MVVMinSwiftUI
//
//  Created by FCI on 10/12/24.
//

import Foundation

extension String {
    func isValidEmail () -> Bool {
     
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate (format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate (with: self)
    }
    
    public var length: Int {
        
        return self.count
    }
                                          
}
