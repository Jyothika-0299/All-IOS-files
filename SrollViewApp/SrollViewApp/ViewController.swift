//
//  ViewController.swift
//  SrollViewApp
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sv1 : UIScrollView!
    @IBOutlet var l1 : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sv1.contentSize = CGSize(width: 550, height: 600)
        
    }
    


}

