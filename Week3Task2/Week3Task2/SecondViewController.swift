//
//  SecondViewController.swift
//  Week3Task2
//
//  Created by FCI on 07/12/24.
//

import UIKit
import MapKit
import QuartzCore

class SecondViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    var lat: String!
    var long: String!
    var temp: String!
    var admin: String!
    var loc: String!
    
    
    var mapViewLayer : CALayer!
    var segmentControlLayer : CALayer!
    var screenviewLayer : CALayer!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // segmented control
        segmentControlLayer = segmentControl.layer
        segmentControlLayer.borderColor = UIColor.black.cgColor
        segmentControlLayer.borderWidth = 2
        segmentControlLayer.cornerRadius = 30
        segmentControlLayer.backgroundColor = UIColor.systemTeal.cgColor
        //mapview
        mapViewLayer = mapView.layer
        mapViewLayer.borderColor = UIColor.black.cgColor
        mapViewLayer.borderWidth = 2
        mapViewLayer.cornerRadius = 30
        mapViewLayer.backgroundColor = UIColor.white.cgColor
        //screen view layer
        screenviewLayer = self.view.layer
        screenviewLayer.borderColor = UIColor.purple.cgColor
        screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        
        let staticLocation = CLLocationCoordinate2D(latitude: Double(lat ?? "") ?? 0.0, longitude: Double(long ?? "") ?? 0.0)
        
        
        let span1 = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        
        let region1 = MKCoordinateRegion(center: staticLocation, span: span1)
        
        mapView.setRegion(region1, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticLocation
        annotation.title = "Address: \(admin!), \(loc!)"
        annotation.subtitle = "Temperature: \(temp!)°C"
        mapView.addAnnotation(annotation)
        
    }
    
    @IBAction func mapTypeChanged(_ sender: UISegmentedControl) {
        
        if segmentControl.selectedSegmentIndex == 0
        {
            mapView.mapType = .standard
        }  else if segmentControl.selectedSegmentIndex == 1 {
            mapView.mapType = .satellite
        } else {
            mapView.mapType = .hybrid
        }
    }
}
    


    
