//
//  ViewController.swift
//  DatePicker
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var dp1 : UIDatePicker!
    @IBOutlet var l1 : UILabel!
    var df1 : DateFormatter!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func dp1Click() {
        df1 = DateFormatter()
        df1.dateStyle = .medium
        df1.timeStyle = .medium
        l1.text = df1.string(from: dp1.date)
        
    }


}

