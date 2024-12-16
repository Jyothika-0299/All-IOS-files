//
//  ViewController.swift
//  Task5App
//
//  Created by FCI on 25/11/24.
//


import UIKit

class ViewController: UIViewController {
    @IBOutlet var sv1 : UIScrollView!
    @IBOutlet var tv1 : UITextView!
    var sv2 : UIScrollView!
    var tv2 : UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sv1.contentSize = CGSize(width: 550, height: 600)
        do {
            let path = Bundle.main.path(forResource: "hyd", ofType: "txt")
            let str = try String(contentsOfFile: path!)
            tv1.text = str
            
        }
        catch {
            print(error.localizedDescription)
        }
        self.displayUI()
    }
        func displayUI() {
            self.view.backgroundColor = .purple
            //text view code
            tv2 = UITextView()
            tv2.frame = CGRect(x: 100, y: 550, width: 280, height: 200)
            tv2.textColor = .black
            tv2.backgroundColor = .yellow
            tv2.returnKeyType = .done
            tv2.textAlignment = .center
            self.view.addSubview(tv2)
            //scroll code
            sv2 = UIScrollView()
            sv2.frame = CGRect(x: 300, y: 650, width: 380, height: 400)
            sv2.contentSize = CGSize(width: 550, height: 600)
            sv2.isScrollEnabled = true
            sv2.showsVerticalScrollIndicator = true
            
            self.view.addSubview(sv2)
            
        }
        @objc func displayText() {
            do {
                let path = Bundle.main.path(forResource: "cat", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                tv2.text = str
            }
            catch {
                print(error.localizedDescription)
            }
        }
}
/*
 let barbuttonitems:[UIBarButtonItem] = [flexibleSpace1,bb5,fixedSpace,bb6,bb7]
 self.t2.items = barbuttonitems
 self.view.addSubview(t2)
 */
