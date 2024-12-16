//
//  ViewController.swift
//  DownloadingimagefromURL
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var l1: UILabel!
    @IBOutlet var img1 : UIImageView!
    @IBOutlet var l2: UILabel!
    @IBOutlet var img2 : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.UsingTheDatastructToDownloadImages()
        self.UsingTheURLSessionToDownloadImages()
        
    }
    func UsingTheDatastructToDownloadImages() {
        let url = URL(string:"https://www.kasandbox.org/programming-images/avatars/leaf-blue.png")!
        DispatchQueue.global().async {
            //fetch image data
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    // create image and update image view
                    print("\(data)")
                    self.img1.image = UIImage(data: data)
                }
            }
            
        }
    }
    func UsingTheURLSessionToDownloadImages() {
        //create url
        let url = URL(string:"https://www.kasandbox.org/programming-images/avatars/leafers-ultimate.png")!
        DispatchQueue.global().async {
            //createn data task
            let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let data1 = data {
                    DispatchQueue.main.async {
                        // create image and update image view
                        print(data1)
                        self.img2.image = UIImage(data: data1)
                    }
                }
            }
            //start data task
            dataTask.resume()
            
        }
        
    }
    
}
