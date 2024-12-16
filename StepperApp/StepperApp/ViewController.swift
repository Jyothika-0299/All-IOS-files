//
//  ViewController.swift
//  StepperApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var stepper1 : UIStepper!
    @IBOutlet var label1 : UILabel!
    var s2 : UIStepper!
    var label2 : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayStepper()
    }
    @IBAction func stepper1Click() {
        let i : Double = stepper1.value
        label1.text = Int(i).description
    }
    func displayStepper() {
        
        s2 = UIStepper()
        s2.frame = CGRect(x: 40, y: 400, width: 180, height: 40)
        s2.value = 0
        s2.minimumValue = 0
        s2.maximumValue = 5
        s2.stepValue = 1
        s2.isContinuous = true
        s2.autorepeat = true
        s2.wraps = true
        s2.backgroundColor = .cyan
        s2.tintColor = .blue
        s2.addTarget(self,action : #selector(s2Click),for: .valueChanged)
        self.view.addSubview(s2)
    }
    @objc func s2Click() {
        let i : Double = s2.value
        label1.text = Int(i).description
    }


}

