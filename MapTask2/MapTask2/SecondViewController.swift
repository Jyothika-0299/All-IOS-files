//
//  SecondViewController.swift
//  MapTask2
//
//  Created by FCI on 02/12/24.
//

import UIKit
import CoreLocation

class SecondViewController: UIViewController {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let geocoder = CLGeocoder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func geocodeAddressTapped(_ sender: UIButton) {
        guard let address = addressTextField.text, !address.isEmpty else {
            resultLabel.text = "Please enter an address"
            return
        }
        
        // Perform forward geocoding
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                self.resultLabel.text = "Error: \(error.localizedDescription)"
                return
            }
            
            if let placemark = placemarks?.first {
                let latitude = placemark.location?.coordinate.latitude ?? 0.0
                let longitude = placemark.location?.coordinate.longitude ?? 0.0
                self.resultLabel.text = "Lat: \(latitude), Long: \(longitude)"
            } else {
                self.resultLabel.text = "No coordinates found"
            }
        }
    }
}

