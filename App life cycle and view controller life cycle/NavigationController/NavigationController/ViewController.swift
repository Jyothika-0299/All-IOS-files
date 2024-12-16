//
//  ViewController.swift
//  NavigationController
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pushButton1 : UIButton!
    @IBOutlet var presentButton1 : UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.navigationController?.isNavigationBarHidden = true
        
        print("first view did load")
       
    }
    override func viewWillAppear(_ animated: Bool) {
        print("first view will appear")
    }
    override func viewWillLayoutSubviews() {
        print("first view will layout subviews")
    }
    override func viewDidLayoutSubviews() {
        print("first view did layout subviews")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("first view did appear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("first view will disappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("first view did disappear")
    }
    
    
    
    @IBAction func pushButton1Click() {
        
    }
    @IBAction func presentButton1Click() {
        
    }
    


}

