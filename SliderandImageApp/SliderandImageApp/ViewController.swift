//
//  ViewController.swift
//  SliderandImageApp
//
//  Created by FCI on 22/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var iv1 : UIImageView!
    @IBOutlet var slider1 : UISlider!
    var iv2 : UIImageView!
    var slider2 : UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.displaySliderAndImageView()
    }
    
    @IBAction func sliderMove1() {
        let value1:Float = slider1.value
        iv1.alpha = CGFloat(value1)
    }
    func displaySliderAndImageView() {
        iv2 = UIImageView()
        iv2.frame = CGRect(x: 30, y: 480, width: 200, height: 200)
        iv2.backgroundColor = .black
        iv2.tintColor = .yellow
        iv2.image = UIImage(systemName: "sun.min.fill")
        iv2.contentMode  = .scaleAspectFit
        iv2.alpha = 1
        self.view.addSubview(iv2)
        
        //slider code
        slider2 = UISlider()
        slider2.frame = CGRect(x: 30, y: 700, width: 180, height: 40)
        slider2.value = 0.5
        slider2.maximumValue = 0
        slider2.maximumValue = 1
        slider2.minimumTrackTintColor = .blue
        slider2.maximumTrackTintColor = .yellow
        slider2.thumbTintColor = .cyan
        slider2.backgroundColor = .purple
        slider2.addTarget(self, action: #selector(sliderMove2), for: .valueChanged)
        self.view.addSubview(slider2)
    
    }
    @objc func sliderMove2() {
        let value2:Float = slider2.value
        iv2.alpha = CGFloat(value2)
    }


}

