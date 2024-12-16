//
//  secondViewController.swift
//  TableViewWithNavigation
//
//  Created by FCI on 27/11/24.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet var l1 : UILabel!
    @IBOutlet var img1 : UIImageView!
    var string1 : String!
    var image1 : UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        l1.text = string1
        img1.image = image1

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
