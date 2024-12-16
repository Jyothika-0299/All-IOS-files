//
//  ViewController.swift
//  WeekTask3#App
//
//  Created by FCI on 25/11/24.
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
        self.displayUI()
        
    }
    func displayUI() {
        self.view.backgroundColor = .purple
        //text view code
        txt1 = UITextView()
        txt1.frame = CGRect(x: 40, y: 550, width: 280, height: 200)
        txt1.textColor = .black
        txt1.backgroundColor = .yellow
        txt1.returnKeyType = .done
        txt1.textAlignment = .center
        self.view.addSubview(txt1)
        //label code
        l1 = UILabel()
        l1.frame = CGRect(x: 20, y: 200, width: 350, height: 44)
        l1.backgroundColor = .black
        l1.textColor = .blue
        l1.textAlignment = .center
        l1.numberOfLines = 3
        self.view.addSubview(l1)
        //segment code
        let segmentNames = ["Place1","Place2","Place3"] as! [Any]
        sc1 = UISegmentedControl(items: segmentNames)
        sc1.frame = CGRect(x: 10, y: 100, width: 350, height: 40)
        sc1.backgroundColor = .cyan
        sc1.selectedSegmentTintColor = .red
        sc1.addTarget(self, action: #selector(sc1Click), for: .valueChanged)
        self.view.addSubview(sc1)
        //image code
        img = UIImageView()
        img.frame = CGRect(x: 30, y: 300, width: 200, height: 100)
        img.backgroundColor = .black
        img.tintColor = .yellow
        img.contentMode  = .scaleAspectFit
        img.alpha = 1
        self.view.addSubview(img)
        
    }
    @objc func sc1Click() {
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
    
    
        




