//
//  ViewController.swift
//  Exam2.1
//
//  Created by FCI on 28/11/24.
//


import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet var text1: UITextField!
    @IBOutlet var text2: UITextField!
    
    var url1: URL!
    var request1: URLRequest!
   
    
    
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    @IBAction func ClickButtonBrowse(_ sender: UIButton) {
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextScreen = segue.destination as! secondViewController
        
        nextScreen.title = text1.text
        
        if let webText = text2.text, let url1 = URL(string: webText) {

            var request1 = URLRequest(url: url1)
            
            nextScreen.check = request1
        } else {
            print("Invalid URL in text2")
        }
    }

}


    

    
    



