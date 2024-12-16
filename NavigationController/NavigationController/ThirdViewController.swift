//
//  ThirdViewController.swift
//  NavigationController
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet var popButton2 : UIButton!
    @IBOutlet var popToRootButton2 : UIButton!
    @IBOutlet var homeButton2 : UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func popButton2Click() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func popToRootButton2Click() {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func homeButton2Click() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

    
}
