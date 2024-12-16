//
//  ViewController.swift
//  PageControlApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pc1 : UIPageControl!
    var pc2 : UIPageControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displayPageControl()
    }
    @IBAction func pc1Click() {
        let index:Int = pc1.currentPage
        if index == 0 {
            self.view.backgroundColor = .cyan
        }
        else if index == 1 {
            self.view.backgroundColor = .blue
        }
        else if index == 2 {
            self.view.backgroundColor = .green
        }
        else {
            self.view.backgroundColor = .purple
        }
    }
    
    func displayPageControl() {
        pc2 = UIPageControl()
        pc2.frame = CGRect(x: 30, y: 450, width: 300, height: 40)
        pc2.currentPage = 0
        pc2.numberOfPages = 4
        pc2.backgroundColor = .cyan
        pc2.currentPageIndicatorTintColor = .red
        pc2.pageIndicatorTintColor = .black
        pc2.addTarget(self, action: #selector(pc2Click), for: .valueChanged)
        self.view.addSubview(pc2)
    }
    @objc func pc2Click() {
        let index:Int = pc2.currentPage
        if index == 0 {
            self.view.backgroundColor = .cyan
        }
        else if index == 1 {
            self.view.backgroundColor = .blue
        }
        else if index == 2 {
            self.view.backgroundColor = .green
        }
        else {
            self.view.backgroundColor = .purple
        }
    }


}

