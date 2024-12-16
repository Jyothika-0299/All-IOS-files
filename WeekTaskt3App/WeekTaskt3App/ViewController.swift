//
//  ViewController.swift
//  WeekTaskt3App
//
//  Created by FCI on 24/11/24.
//

import UIKit

class ViewController: UIViewController {
    //
    //  ViewController.swift
    //  SegmentedControlApp
    //
    //  Created by FCI on 22/11/24.
    //

   
    @IBOutlet var sc1 : UISegmentedControl!
    @IBOutlet var l1 : UILabel!
    @IBOutlet var img : UIImageView!
    @IBOutlet var txt1 : UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
    }
    @IBAction func sc1click() {
        let index : Int = sc1.selectedSegmentIndex
        if index == 0 {
            self.view.backgroundColor = .orange
            sc1.selectedSegmentTintColor = .orange
            l1.text = "Hyderbad"
            self.img.image = UIImage(named: "resort.jpeg")
            do {
                let path = Bundle.main.path(forResource: "hyd", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                txt1.text = str

            }
            catch {
                print(error.localizedDescription)
                
            }

            
        
        }
        else if index == 1 {
            self.view.backgroundColor = .purple
            sc1.selectedSegmentTintColor = .purple
            l1.text = "Japan"
            self.img.image = UIImage(named: "cat.jpeg")
            do {
                let path = Bundle.main.path(forResource: "cat", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                txt1.text = str

            }
            catch {
                print(error.localizedDescription)
                
            }
            
            
                
        }
        else {
            self.view.backgroundColor = .black
            sc1.selectedSegmentTintColor = .black
            l1.text = "AP"
            self.img.image = UIImage(named: "pup.jpeg")
            do {
                let path = Bundle.main.path(forResource: "puppy", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                txt1.text = str

            }
            catch {
                print(error.localizedDescription)
                
            }
        }
    }
    
    
        
}


