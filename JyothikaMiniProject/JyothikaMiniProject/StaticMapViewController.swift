//
//  StaticMapViewController.swift
//  JyothikaFinalProject
//
//  Created by FCI on 12/12/24.
//

// Imports the UIKit framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import MapKit
import QuartzCore
// Defines a ViewController class that manages the app's user interface.
class StaticMapViewController: UIViewController {
    // Connects below different UIObjects from the storyboard to this code.
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet var ShareButton : UIButton!
    var lat: String!
    var long: String!
    var temp: String!
    var admin: String!
    var loc: String!
    //core animation
    var mapViewLayer : CALayer!
    var segmentControlLayer : CALayer!
    var screenviewLayer : CALayer!
    var homeButton1 : UIBarButtonItem!
    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        //home button implementation
        homeButton1 = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButton1Click))
        self.navigationItem.rightBarButtonItem = homeButton1
        homeButton1.tintColor = .white
        // core animation for segmented control
        segmentControlLayer = segmentControl.layer
        segmentControlLayer.borderColor = UIColor.black.cgColor
        segmentControlLayer.borderWidth = 2
        segmentControlLayer.cornerRadius = 30
        //segmentControlLayer.backgroundColor = UIColor.systemTeal.cgColor
        //core animation for mapview
        mapViewLayer = mapView.layer
        mapViewLayer.borderColor = UIColor.black.cgColor
        mapViewLayer.borderWidth = 2
        mapViewLayer.cornerRadius = 30
        //mapViewLayer.backgroundColor = UIColor.white.cgColor
        //core animation for screen view layer
        screenviewLayer = self.view.layer
        //screenviewLayer.borderColor = UIColor.purple.cgColor
        //screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        //annotation with temperature and address details
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
    // Defines an action triggered when the button is tapped.
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
    // Defines an action triggered when the button is tapped.
    @IBAction func ShareClick() {
        let sharetext = "Address : \(admin!), \(loc!)\nTemperature : \(temp!)°C"
        let shareAll = [sharetext] as [Any]
        print(shareAll)
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated: true)
    }
    //home button function
    @objc func homeButton1Click() {
            self.navigationController?.popToRootViewController(animated: true)
        }
}
    


    


