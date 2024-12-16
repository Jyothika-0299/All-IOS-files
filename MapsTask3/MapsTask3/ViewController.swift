//
//  ViewController.swift
//  MapsTask3
//
//  Created by FCI on 02/12/24.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var label1: UILabel!
    
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var getLocationDetailsButton: UIButton!
    
    @IBOutlet var mapview1: MKMapView!
    
    
    @IBOutlet var details: UILabel!
    
    var locationManager: CLLocationManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Requests the user’s permission to use location services regardless of whether the app is in use.
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        
    }
    
    @IBAction func getLocationDetailsButtonCLick() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager = CLLocationManager()
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            print("Location services are enabled")
            statusLabel.text = "Location services are enabled"
        }
        else {
            
            print("Location services are not enabled")
            statusLabel.text = "Location services are Not enabled"
            
        }
    }
    
    // CLLocationManagerDelegate Protcol Methods implementation here
    
    // once location values are available then this function will execute
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // getting location values and displaying in labels
        
        let lat: Double = manager.location!.coordinate.latitude
        let long: Double = manager.location!.coordinate.longitude
        
        print("\(lat) and \(long)")
        
        latitudeLabel.text = "latitude: \(lat)"
        longitudeLabel.text = "longitude: \(long)"
        
        
        // Reverse Geo COding

           
           if let loc = CLLocation(latitude: lat, longitude: long) as? CLLocation {
               
        CLGeocoder().reverseGeocodeLocation(loc, completionHandler: { (placemarks, error) in
           
            if let placemark1 = placemarks?[0] {
                
                let name = placemark1.name!
                let country = placemark1.country!
                let adminstrative = placemark1.administrativeArea!
                let locality = placemark1.locality!
                let postalCode = placemark1.postalCode!
                
                
                print("\(name),\(adminstrative), \(locality),\(country), \(postalCode)")
                
                self.details.text = """
                \(name)\(adminstrative)
                \(locality)\(country)
                \(postalCode)
                """

           }
           })
           }
        
        
        // code for updating location values to map
        
        let locationValue: CLLocationCoordinate2D = manager.location!.coordinate
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
               
        let region = MKCoordinateRegion(center: locationValue, span: span)
               
        mapview1.setRegion(region, animated: true)
        
        // code for adding annotation on MAP
        
               let annotation = MKPointAnnotation()
               annotation.coordinate = locationValue
               annotation.title = "Current Location Found"
               annotation.subtitle = "You are Here..!!"
               mapview1.addAnnotation(annotation)
    }
    // once location values are Not-Available then this function will execute
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error)")
        statusLabel.text = "\(error)"
    }
}

