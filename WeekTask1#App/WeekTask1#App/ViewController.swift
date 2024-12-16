//
//  ViewController.swift
//  WeekTask1#App
//
//  Created by FCI on 24/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var pc1: UIPageControl!
    @IBOutlet var img1: UIImageView!
    @IBOutlet var img2: UIImageView!
    @IBOutlet var img3: UIImageView!
    @IBOutlet var img4: UIImageView!
    @IBOutlet var img5: UIImageView!
       
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    @IBAction func showImages(){
            
        let index:Int = pc1.currentPage
            
        if index == 1{
            self.img1.image = UIImage(named: "nature.jpeg")
            self.view.backgroundColor = .blue
        }
            
        else if index == 2{
            self.img2.image = UIImage(named: "resort.jpeg")
            self.view.backgroundColor = .purple
        }
        else if index == 3{
            self.img3.image = UIImage(named: "pup.jpeg")
            self.view.backgroundColor = .red
        }
        else if index == 4{
            self.img4.image = UIImage(named: "park.jpeg")
            self.view.backgroundColor = .cyan
        }
        
    }

}

   
