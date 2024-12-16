//
//  ViewController.swift
//  Task6
//
//  Created by FCI on 26/11/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    @IBOutlet var tf1 : UITextField!
    @IBOutlet var b1 : UIButton!
    @IBOutlet var wb1 : WKWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func b1Click() {
        guard let urlString = tf1.text,!urlString.isEmpty, let url = URL(string: urlString), UIApplication.shared.canOpenURL(url)
        else {
            return
        }
        let alert = UIAlertController(title: "Title", message: "please select an option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "webkit view", style: .default, handler: { [weak self] _ in
            self?.openInWebKit(url:url)
        }))
        alert.addAction(UIAlertAction(title: "safari view", style: .default, handler: { [weak self] _ in
            self?.openInSafari(url:url)
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .destructive, handler: { _ in
            print("user clicked cancel button..!")
        }))
        
        //display alert
        self.present(alert, animated: true, completion: nil)
        print("completion block")
        
    }
    func openInWebKit(url: URL) {
        if wb1 == nil {
            wb1 = WKWebView(frame: self.view.bounds)
            self.view.addSubview(wb1)
        }
        wb1.load(URLRequest(url: url))
    }
    func openInSafari(url: URL) {
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
    }
}




