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
        print("Third view did load")
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
    override func viewWillAppear(_ animated: Bool) {
        print("Third view will appear")
    }
    override func viewWillLayoutSubviews() {
        print("Third view will layout subviews")
    }
    override func viewDidLayoutSubviews() {
        print("Third view did layout subviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("Third view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("Third view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("Third view did disappear")
    }
    
    

    
}
