//
//  ViewController.swift
//  Exam2.2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var img1 : UIImageView!
    @IBOutlet var tv1 : UITextView!
    var image1 : UIImage!
    var string1 : String!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tv1.text = string1
        img1.image = image1
        
        if let fileName = string1 {
            loadTextFromFile(fileName)
        }
        
    }
    func loadTextFromFile(_ fileName: String) {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: nil) {
            do {
                let fileContent = try String(contentsOfFile: filePath, encoding: .utf8)
                tv1.text = fileContent
            } catch {
                // Handle error if file reading fails
                print("Error loading text file: \(error)")
            }
        }
    }
}

    




