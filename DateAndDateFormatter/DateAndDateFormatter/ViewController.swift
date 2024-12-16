//
//  ViewController.swift
//  DateAndDateFormatter
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var b1 : UIButton!
    @IBOutlet var l1 : UILabel!
    var dateinfo : Date!
    var df1 : DateFormatter!
    @IBOutlet var l2 : UILabel!
    var timer : Timer!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    @objc func tick() {
        l2.text = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .medium)
    }
    @IBAction func b1Click() {
        dateinfo = Date()
        print(dateinfo!)
        df1 = DateFormatter()
        df1.dateStyle = .medium
        df1.timeStyle = .medium
        l1.text = df1.string(from:dateinfo )
    }


}

