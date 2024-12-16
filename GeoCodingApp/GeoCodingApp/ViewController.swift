//
//  ViewController.swift
//  GeoCodingApp
//
//  Created by FCI on 02/12/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet var b1 : UIButton!
    @IBOutlet var l1: UILabel!
    @IBOutlet var b2 : UIButton!
    @IBOutlet var l2: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func b1Click() {
        // reverse geo
        let lat = 17.3850
        let lon = 78.4867
        if let loc = CLLocation(latitude: lat, longitude: lon) as? CLLocation {
            CLGeocoder().reverseGeocodeLocation(loc, completionHandler: {(placemarks, error) in
                if let placemark1 = placemarks?[0] {
                    let name = placemark1.name!
                    let country = placemark1.country!
                    let adminstrative = placemark1.administrativeArea!
                    let locality = placemark1.locality!
                    let postalCode = placemark1.postalCode!
                    
                    print("\(name),\(adminstrative), \(locality), \(country), \(postalCode)")
                    self.l1.text = "\(name),\(adminstrative), \(locality), \(country), \(postalCode)"
                    
                }
            })
        }
        
    }
    @IBAction func b2Click() {
        // forward geo code
        let address = "India, Hyderbad,500095"
        CLGeocoder().geocodeAddressString(address, completionHandler: { placemarks, error in
            if (error != nil) {
                return
                print("\(error)")
            }
            if let placemark1 = placemarks?[0] {
                let lat = String(format : "%.04f",(placemark1.location?.coordinate.latitude ?? 0.0)!)
                let lon = String(format : "%.04f",(placemark1.location?.coordinate.longitude ?? 0.0)!)
                print("\(lat),\(lon)")
                self.l2.text = "latitude: \(lat) and longitude: \(lon)"
                
            }
        })
        
    }
    


}

