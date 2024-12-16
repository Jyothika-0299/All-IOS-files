//
//  ViewController.swift
//  SegmentedControlApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sc1 : UISegmentedControl!
    var sc2 : UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displaySegmentedControl()
    }
    @IBAction func sc1click() {
        let index : Int = sc1.selectedSegmentIndex
        if index == 0 {
            self.view.backgroundColor = .orange
            sc1.selectedSegmentTintColor = .orange
        }
        else if index == 1 {
            self.view.backgroundColor = .purple
            sc1.selectedSegmentTintColor = .purple
            
        }
        else {
            self.view.backgroundColor = .black
            sc1.selectedSegmentTintColor = .black
        }
    }
    func displaySegmentedControl() {
        let segmentNames = ["orange","purple","black",UIImage(systemName: "pencil.circle.fill")!] as! [Any]
        sc2 = UISegmentedControl(items: segmentNames)
        sc2.frame = CGRect(x: 40, y: 300, width: 350, height: 40)
        sc2.backgroundColor = .cyan
        sc2.selectedSegmentTintColor = .red
        sc2.addTarget(self, action: #selector(sc2Click), for: .valueChanged)
        self.view.addSubview(sc2)
            
    }
    @objc func sc2Click() {
        let index:Int = sc2.selectedSegmentIndex
        if index == 0 {
            self.view.backgroundColor = .orange
            
        }
        else if index == 1 {
            self.view.backgroundColor = .green
            
        }
        else if index == 2 {
            self.view.backgroundColor = .purple
        }
    }
            


}

