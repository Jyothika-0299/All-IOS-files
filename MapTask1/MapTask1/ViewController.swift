//
//  ViewController.swift
//  MapTask1
//
//  Created by FCI on 02/12/24.
//


import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController {
    @IBOutlet var mv1 : MKMapView!
    @IBOutlet var b1 : UIButton!
    @IBOutlet var tf1 : UITextField!
    @IBOutlet var tf2 : UITextField!
    @IBOutlet var tf3 : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func b1Click() {
              let latitudeText = tf1.text
              let longitudeText = tf2.text
              let placeName = tf3.text
        let latitude = Double(latitudeText!)
        let longitude = Double(longitudeText!)
        let location = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
        let region1 = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mv1.setRegion(region1, animated: true)
        // Annotations
        // Dsiplaying annotation on mapview
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = placeName
        
        
        mv1.addAnnotation(annotation)
        
    }
}
