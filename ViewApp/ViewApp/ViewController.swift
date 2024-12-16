//
//  ViewController.swift
//  ViewApp
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sc1 : UISegmentedControl!
    @IBOutlet var view1 : UIView!
    @IBOutlet var view2 : UIView!
    @IBOutlet var view3 : UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
    }
    @IBAction func sc1Click() {
        let index:Int = sc1.selectedSegmentIndex
        if index == 0 {
            view1.isHidden = false
            view2.isHidden = true
            view3.isHidden = true
        }
        else if index == 1 {
            view1.isHidden = true
            view2.isHidden = false
            view3.isHidden = true
        }
        else if index == 2 {
            view1.isHidden = true
            view2.isHidden = true
            view3.isHidden = false
        }
        
    }


}

