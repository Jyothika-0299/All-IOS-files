//
//  secondViewController.swift
//  NavigationControllerCoding
//
//  Created by FCI on 26/11/24.
//

import UIKit

class secondViewController: UIViewController {
    var b3 : UIButton!
    var b4  : UIButton!
    var homeButton1 : UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        self.title = "second"
        b3 = UIButton()
        b3.frame = CGRect(x: 30, y: 340, width: 150, height: 30)
        b3.backgroundColor = .red
        b3.setTitle("POP", for: .normal)
        b3.addTarget(self, action: #selector(b3Click), for: .touchUpInside)
        self.view.addSubview(b3)
        b4 = UIButton()
        b4.frame = CGRect(x: 30, y: 460, width: 150, height: 30)
        b4.backgroundColor = .black
        b4.setTitle("DISMISS", for: .normal)
        b4.addTarget(self, action: #selector(b4Click), for: .touchUpInside)
        self.view.addSubview(b4)
        homeButton1 = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButton1Click))
        self.navigationItem.rightBarButtonItem = homeButton1

        // Do any additional setup after loading the view.
    }
    @objc func b3Click()  {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func b4Click()  {
        self.dismiss(animated: true)
    }
    @objc func homeButton1Click()  {
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
