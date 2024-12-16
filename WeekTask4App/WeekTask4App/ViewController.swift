//
//  ViewController.swift
//  WeekTask4App
//
//  Created by FCI on 25/11/24.
//



import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var webkitView1 : WKWebView!
    @IBOutlet var sc1 : UISegmentedControl!
    var url1 :URL!
    var request1 : URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func sc1click() {
        let index : Int = sc1.selectedSegmentIndex
        if index == 0 {
            self.view.backgroundColor = .orange
            sc1.selectedSegmentTintColor = .orange
            url1 = URL(string: "https://www.apple.com")
            request1 = URLRequest(url : url1)
            webkitView1.load(request1)
            
        }
        else if index == 1 {
            self.view.backgroundColor = .purple
            sc1.selectedSegmentTintColor = .purple
            url1 = URL(string: "https://www.google.com")
            request1 = URLRequest(url : url1)
            webkitView1.load(request1)
            
        }
        else {
            self.view.backgroundColor = .black
            sc1.selectedSegmentTintColor = .black
            url1 = URL(string: "https://www.android.com")
            request1 = URLRequest(url : url1)
            webkitView1.load(request1)
            
        }
    }
}

