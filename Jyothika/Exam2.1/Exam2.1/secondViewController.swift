//
//  secondViewController.swift
//  Exam2.1
//
//  Created by FCI on 28/11/24.
//


import UIKit
import WebKit


class secondViewController: UIViewController {
    
    
    @IBOutlet var webview: WKWebView!
    
    var check: URLRequest?!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let request = check {
            webview.load(request!)
        } else {
            print("Incorrect URLRequest")
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


