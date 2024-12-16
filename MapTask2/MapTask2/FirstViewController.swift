//
//  FirstViewController.swift
//  MapTask2
//
//  Created by FCI on 02/12/24.
//


import UIKit
import CoreLocation

class FirstViewController: UIViewController {
    
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func geocodeTapped(_ sender: UIButton) {
        guard let latitude = Double(latitudeTextField.text ?? ""),
              let longitude = Double(longitudeTextField.text ?? "") else {
            resultLabel.text = "Invalid coordinates"
            return
        }

        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        // Perform reverse geocoding
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                self.resultLabel.text = "Error: \(error.localizedDescription)"
                return
            }
            
            if let placemark = placemarks?.first {
                self.resultLabel.text = placemark.name ?? "No address found"
            } else {
                self.resultLabel.text = "No address found"
            }
        }
    }
}

