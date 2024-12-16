//
//  ViewController.swift
//  WeekTask1App
//
//  Created by FCI on 24/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pc1 : UIPageControl!
    @IBOutlet var iv1 : UIPageControl!
    @IBOutlet var iv2 : UIPageControl!
    @IBOutlet var iv3 : UIPageControl!
    @IBOutlet var iv4 : UIPageControl!
    @IBOutlet var iv5 : UIPageControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pc1Click() {
        let index:Int = pc1.currentPage
        if index == 0 {
            iv1.alpha = CGFloat(index)
            self.view.backgroundColor = .cyan
        }
        else if index == 1 {
            iv2.alpha = CGFloat(index)
            self.view.backgroundColor = .blue
        }
        else if index == 2 {
            iv3.alpha = CGFloat(index)
            self.view.backgroundColor = .green
        }
        else if index == 3 {
            iv4.alpha = CGFloat(index)
            self.view.backgroundColor = .purple
        }
        else {
            iv5.alpha = CGFloat(index)
            self.view.backgroundColor = .black
        }
    }
    
      


}

