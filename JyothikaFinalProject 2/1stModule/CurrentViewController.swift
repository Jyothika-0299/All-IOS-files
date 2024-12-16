//
//  CurrentViewController.swift
//  JyothikaFinalProject
//
//  Created by FCI on 12/12/24.
//


// Imports the UIKit framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import CoreLocation
import QuartzCore
// Defines a ViewController class that manages the app's user interface.
class CurrentViewController: UIViewController, CLLocationManagerDelegate {
    // Connects below different UIObjects from the storyboard to this code.
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var details: UILabel!
    @IBOutlet var getLocationDetailsButton: UIButton!
    @IBOutlet var fetchWhetherTapped: UIButton!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet var wind: UILabel!
    @IBOutlet weak var navigateToMapTapped: UIButton!
    var locationManager: CLLocationManager!
    var lat: String?
    var long: String?
    var temperaturevalue: String?
    var administrativeArea1: String?
    var locality1: String?
    var name1: String?
    var postalCode1: String?
    var country1: String?
    //home button
    var homeButton1 : UIBarButtonItem!
    //core animation
    var labelLayer : CALayer!
    var Button : CALayer!
    var screenviewLayer : CALayer!

    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        //core animation for latitude label
        labelLayer = latitudeLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for longitude label
        labelLayer = longitudeLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for details label
        labelLayer = details.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for temparature label
        labelLayer = temperatureLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for humidity label
        labelLayer = humidityLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for wind label
        labelLayer = wind.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation fetchwhetherbutton layer
        Button = fetchWhetherTapped.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 5
        //Button.backgroundColor = UIColor.yellow.cgColor
        //core animation navigatetomapbutton layer
        Button = navigateToMapTapped.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 5
        //Button.backgroundColor = UIColor.yellow.cgColor
        //core animation screen view layer
        screenviewLayer = self.view.layer
        //screenviewLayer.borderColor = UIColor.systemPink.cgColor
        //screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        
        //home  button code
        homeButton1 = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButton1Click))
        self.navigationItem.rightBarButtonItem = homeButton1
        homeButton1.tintColor = .white
        
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
    }
    // Defines an action triggered when the button is tapped
    @IBAction func getLocationDetailsButtonClick() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            print("Location services are enabled")
        }
        else {
            
            print("Location services are not enabled")
            
        }
    }
    // CLLocationManagerDelegate Protcol Methods implementation here
    
    // once location values are available then this function will execute
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // getting location values and displaying in labels
                guard let location = locations.last else { return }

                let latValue = location.coordinate.latitude
                let longValue = location.coordinate.longitude

                lat = String(latValue)
                long = String(longValue)

                DispatchQueue.main.async {
                    self.latitudeLabel.text = "Latitude: \(self.lat ?? "Unknown")"
                    self.longitudeLabel.text = "Longitude: \(self.long ?? "Unknown")"
                }

                CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                    if let error = error {
                        print("Reverse geocoding failed: \(error.localizedDescription)")
                        self.showAlert(title: "Error", message: "Unable to fetch address. Try again.")
                        return
                    }

                    if let placemark = placemarks?.first {
                        self.name1 = placemark.name ?? "Unknown"
                        self.country1 = placemark.country ?? "Unknown"
                        self.administrativeArea1 = placemark.administrativeArea ?? "Unknown"
                        self.locality1 = placemark.locality ?? "Unknown"
                        self.postalCode1 = placemark.postalCode ?? "Unknown"

                        DispatchQueue.main.async {
                            self.details.text = """
                            \(self.name1!), \(self.locality1!),
                            \(self.administrativeArea1!), \(self.postalCode1!),
                            \(self.country1!)
                            """
                        }
                    }
                }

                locationManager.stopUpdatingLocation()
            }
    // Defines an action triggered when the button is tapped
    @IBAction func fetchWhetherTappedClick() {
            guard let lat = lat, let long = long else {
                showAlert(title: "Error", message: "Please fetch your current location first.")
                return
            }
        // 1. preparing the url
            let session = URLSession.shared
            guard let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(long)&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric") else {
                showAlert(title: "Error", message: "Invalid URL.")
                return
            }
        //2. Sending Request to Server
            let task = session.dataTask(with: webserviceURL) { data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        self.showAlert(title: "Error", message: "Failed to fetch weather: \(error.localizedDescription)")
                    }
                    return
                }

                guard let data = data else { return }
                // json parsing
                if let firstDictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                    if let mainData = firstDictionary.value(forKey: "main") as? NSDictionary {
                        //display temperature
                        if let temperature = mainData.value(forKey: "temp") as? Double {
                            DispatchQueue.main.async {
                                self.temperatureLabel.text = "Temperature: \(temperature)°C"
                                self.temperaturevalue = "\(temperature)"
                            }
                        }
                        //display humidity
                        if let humidity = mainData.value(forKey: "humidity") as? Int {
                            DispatchQueue.main.async {
                                self.humidityLabel.text = "Humidity: \(humidity)%"
                            }
                        }
                    }
                    //display wind
                    if let windData = firstDictionary.value(forKey: "wind") as? NSDictionary,
                       let speed = windData.value(forKey: "speed") as? Double {
                        DispatchQueue.main.async {
                            self.wind.text = "WindSpeed: \(speed) m/s"
                        }
                    }
                }
            }
            task.resume()
        }

        // Show Maps Action
        @IBAction func showMaps(_ sender: UIButton) {
            // Add logic for showing maps here.
        }

        //  Prepare for Segue
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let nextScreen = segue.destination as? CurrentMapViewController {
                nextScreen.title = locality1
                nextScreen.lat = lat
                nextScreen.long = long
                nextScreen.admin = administrativeArea1
                nextScreen.locality = locality1
                nextScreen.post = postalCode1
                nextScreen.name = name1
                nextScreen.cout = country1
                nextScreen.temp = temperaturevalue
            }
        }

        //  Helper Method to Show Alerts
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    
    // home button function
    @objc func homeButton1Click() {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }


        
    
