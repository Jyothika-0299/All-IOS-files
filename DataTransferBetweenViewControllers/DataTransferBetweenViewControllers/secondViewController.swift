//
//  secondViewController.swift
//  DataTransferBetweenViewControllers
//
//  Created by FCI on 26/11/24.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet var l1 : UILabel!
    @IBOutlet var iv1 : UIImageView!
    var name : String!
    var image : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        name = "cat"
        l1.text = name
        
        iv1.image = UIImage(named: image)

        // Do any additional setup after loading the view.
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
