//
//  ViewController.swift
//  SFSafariViewControllerApp
//
//  Created by FCI on 25/11/24.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    @IBOutlet var button1 : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button1Click() {
        guard let appleurl = URL(string : "https://www.apple.com")
        else {
            return
        }
        
        let safariVC = SFSafariViewController(url: appleurl)
        present(safariVC, animated: true,completion:nil)
        
    }


}

