//
//  ViewController.swift
//  TextViewApp
//
//  Created by FCI on 22/11/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet var tv1 : UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayDataInTextView()
    }
    func displayDataInTextView() {
        do {
            let path = Bundle.main.path(forResource: "hyd", ofType: "txt")
            let str = try String(contentsOfFile: path!)
            tv1.text = str
            
        }
        catch {
            print(error.localizedDescription)
            
        }
        
    }


}

