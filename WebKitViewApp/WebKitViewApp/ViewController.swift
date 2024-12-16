//
//  ViewController.swift
//  WebKitViewApp
//
//  Created by FCI on 25/11/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet var webkitView1 : WKWebView!
    var url1 :URL!
    var request1 : URLRequest!
    var webKitView2 : WKWebView!
    var url2 : URL!
    var request2 : URLRequest!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        url1 = URL(string: "https://www.apple.com")
        request1 = URLRequest(url : url1)
        webkitView1.load(request1)
        self.displayWebKitView()
    }
    func displayWebKitView() {
        webKitView2 = WKWebView()
        webKitView2.frame = CGRect(x: 20, y: 500, width: 350, height: 380)
        self.view.addSubview(webKitView2)
        url2 = URL(string: "https://www.google.com")
        request2 = URLRequest(url : url2)
        webKitView2.load(request2)
        
    }


}

