//
//  SecondViewController.swift
//  NavigationController
//
//  Created by FCI on 26/11/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var popButton1 : UIButton!
    @IBOutlet var popToRootButton1 : UIButton!
    @IBOutlet var dismissButton1 : UIButton!
    @IBOutlet var pushButton2 : UIButton!
    @IBOutlet var homeButton1 : UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func popButton1Click() {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func popToRootButton1Click() {
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func dismissButton1Click() {
        self.dismiss(animated: true)
        
    }
    @IBAction func pushButton2Click() {
        
    }
    @IBAction func homeButton1Click() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
