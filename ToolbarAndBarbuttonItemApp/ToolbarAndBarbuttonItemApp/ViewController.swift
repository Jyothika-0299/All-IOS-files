//
//  ViewController.swift
//  ToolbarAndBarbuttonItemApp
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tb1 : UIToolbar!
    @IBOutlet var bb1 : UIBarButtonItem!
    @IBOutlet var bb2 : UIBarButtonItem!
    @IBOutlet var bb3 : UIBarButtonItem!
    var t2 : UIToolbar!
    var bb5 : UIBarButtonItem!
    var bb6 : UIBarButtonItem!
    var bb7 : UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayToolBarAndBarbuttonItems()
    }
    @IBAction func bb1Click() {
        self.view.backgroundColor = .orange
    }
    @IBAction func bb2Click() {
        self.view.backgroundColor = .purple
    }
    @IBAction func bb3Click() {
        self.view.backgroundColor = .blue
    }
    
    func displayToolBarAndBarbuttonItems() {
        t2 = UIToolbar()
        t2.frame = CGRect(x: 20, y: 400, width: 340, height: 60)
        t2.barStyle = .default
        t2.barTintColor = .yellow
        let flexibleSpace1 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        bb5 = UIBarButtonItem(title:"first", style:.plain, target:self, action: #selector(click5))
        let fixedSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        bb6 = UIBarButtonItem(barButtonSystemItem: .camera, target:self, action: #selector(click6))
        bb7 =   UIBarButtonItem(image: UIImage(systemName: "sun.min.fill"), style:.plain, target:self, action: #selector(click7))
        let barbuttonitems:[UIBarButtonItem] = [flexibleSpace1,bb5,fixedSpace,bb6,bb7]
        self.t2.items = barbuttonitems
        self.view.addSubview(t2)
        
        
        
    }
    @objc func click5() {
        self.view.backgroundColor = .orange
    }
    @objc func click6() {
        self.view.backgroundColor = .purple
    }
    @objc func click7() {
        self.view.backgroundColor = .blue
    }

}

