//
//  ViewController.swift
//  CurrentLocationApp
//
//  Created by FCI on 02/12/24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var l1 : UILabel!
    @IBOutlet var lat1 : UILabel!
    @IBOutlet var lon1 : UILabel!
    @IBOutlet var statusLabel : UILabel!
    
    @IBOutlet var b1 : UIButton!
    @IBOutlet var mv1 : MKMapView!
    var locationManager : CLLocationManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
    }
    @IBAction func b1Click() {
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            print("location services enabled")
            statusLabel.text = "Location services are enabled"
            
            
        }
        else {
            print("location services not enabled")
            statusLabel.text = "Location services are not enabled"
        }
        
    }
    // cllocationmanagerdelegate protol methods implementation
    // once location values are available then this function will ececute
    func locationManager(_ manager: CLLocationManager,didUpdateLocations locations: [CLLocation]) {
        let lat: Double = manager.location!.coordinate.latitude
        let long: Double = manager.location!.coordinate.longitude
        print("\(lat) and \(long)")
        lat1.text = "latitude:\(lat)"
        lon1.text = "latitude:\(long)"
        // code for updating location values to map
        let locationValue : CLLocationCoordinate2D = manager.location!.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locationValue, span: span)
        mv1.setRegion(region, animated : true)
        //  code for adding annottaion on map
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationValue
        annotation.title = "current loc found"
        mv1.addAnnotation(annotation)
        
    }
    // once loc values are not vailable then this func will execute
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(error)")
        statusLabel.text = "\(error)"
    }

}

