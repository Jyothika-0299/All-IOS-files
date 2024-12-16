//
//  StaticViewController.swift
//  JyothikaFinalProject
//
//  Created by FCI on 12/12/24.
//


// Imports the UIKit framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import CoreLocation
import QuartzCore


// Defines a ViewController class that manages the app's user interface.
class StaticViewController: UIViewController {
    
    // Connects below different UIObjects from the storyboard to this code.
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet var wind: UILabel!
    @IBOutlet var descript: UILabel!
    @IBOutlet weak var fetchWhetherTapped : UIButton!
    @IBOutlet weak var navigateToMapTapped: UIButton!
    var homeButton1 : UIBarButtonItem!
    let locationManager = CLLocationManager()
    var latitude: String!
    var longitude: String!
    var temperaturevalue: String!
    var administrativeArea: String!
    var locality: String!
    
    //core animation
    var labelLayer : CALayer!
    var textfieldLayer : CALayer!
    var Button : CALayer!
    var screenviewLayer : CALayer!
     
    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        //home button implementation
        homeButton1 = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButton1Click))
        self.navigationItem.rightBarButtonItem = homeButton1
        
        homeButton1.tintColor = .white
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
        // core animation for descript label
        labelLayer = descript.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for citytextfield label
        textfieldLayer = cityTextField.layer
        textfieldLayer.borderColor = UIColor.black.cgColor
        textfieldLayer.borderWidth = 2
        textfieldLayer.cornerRadius = 5
        //textfieldLayer.backgroundColor = UIColor.systemRed.cgColor
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
         
    }
    // Defines an action triggered when the button is tapped.
    @IBAction func fetchWhetherTapped(_ sender: UIButton) {
        if cityTextField.text?.isEmpty == true {
        //guard let cityName = cityTextField.text, !cityTextField.isEmpty else {
                    showAlert(title: "Error", message: "Please enter a city name.")
                    return
                }
                
        // 1. preparing the url
        let session1 = URLSession.shared
        let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityTextField.text!)?&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
        print("Sending Request --> Webservice URL:\n\(webserviceURL)")
        //2. Sending Request to Server
        let task1 = session1.dataTask(with: webserviceURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error1 = error
            {
                print("Error:\n\(error1)")
            }
            else
            {
                if let data1 = data
                {
                    // server sents data in the form of bytes
                    print("Bytes Data:\n\(data1)")
                    //3. coverting bytes to String
                    let dataString = String(data: data1, encoding: String.Encoding.utf8)
                    print("All the weather data:\n\(dataString!)")
                    // json parsing
                    if let firstDictionary = try? JSONSerialization.jsonObject(with: data1, options: .allowFragments) as? NSDictionary
                    {
                        print("first Dictionary values: \(firstDictionary)")
                        if let secondDictionary = firstDictionary.value(forKey: "main") as? NSDictionary {
                            
                            print("main Dictionary values are: \(secondDictionary)")
                            
                            
                            // to display temperature
                            
                            if let temperaturevalue = secondDictionary.value(forKey: "temp") {
                                DispatchQueue.main.async {
                                    print("\(self.cityTextField.text!): \(temperaturevalue)°C")
                                    self.temperatureLabel.text = " Temperature: \(temperaturevalue)°C"
                                    self.temperaturevalue = "\(temperaturevalue)"
                                }
                            }
                            // display humidity
                            if let humidityValue = secondDictionary.value(forKey: "humidity") {
                                DispatchQueue.main.async {
                                    print("\(self.cityTextField.text!): \(humidityValue)°C")
                                    self.humidityLabel.text = " Humidity: \(humidityValue)"
                                }
                            }
                            
                            if let thirdDictionary = firstDictionary.value(forKey: "coord") as? NSDictionary {
                                // To display latitude
                                if let latValue = thirdDictionary.value(forKey: "lat") {
                                    DispatchQueue.main.async {
                                        self.latitudeLabel.text = "Latitude: \(latValue)"
                                        self.latitude = "\(latValue)"
                                    }
                                }
                                
                                // To display longitude
                                if let longValue = thirdDictionary.value(forKey: "lon") {
                                    DispatchQueue.main.async {
                                        self.longitudeLabel.text = "Longitude: \(longValue)"
                                        self.longitude = "\(longValue)"
                                        
                                    }
                                }
                                if let latitude = thirdDictionary.value(forKey: "lat") as? Double,
                                   let longitude = thirdDictionary.value(forKey: "lon") as? Double {
                                    let location = CLLocation(latitude: latitude, longitude: longitude)
                                    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                                        if error != nil {
                                            let alert = UIAlertController(title: "Geocoding error", message: "Invalid Details.", preferredStyle: .alert)
                                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                                            self.present(alert, animated: true)
                                            return
                                        } else if let placemark = placemarks?.first {
                                            DispatchQueue.main.async {
                                                
                                                let name = placemark.name ?? "Unknown"
                                                let country = placemark.country ?? "Unknown"
                                                let administrativeArea = placemark.administrativeArea ?? "Unknown"
                                                let locality = placemark.locality ?? "Unknown"
                                                let postalCode = placemark.postalCode ?? "Unknown"
                                                
                                                self.administrativeArea = "\(administrativeArea)"
                                                self.locality = "\(locality)"
                                                
                                                self.details.text = """
                                                    \(name)
                                                    \(country)
                                                    \(administrativeArea)
                                                    \(locality)
                                                    \(postalCode)
                                                    """
                                
                                            }
                                        }
                                    }
                                }
                                //display wind
                                if let fourthDictionary = firstDictionary.value(forKey: "wind") as? NSDictionary {
                                    // To display wind
                                    if let speedvalue = fourthDictionary.value(forKey: "speed") {
                                        DispatchQueue.main.async {
                                            self.wind.text = "WindSpeed: \(speedvalue)"
                                        }
                                    }
                                }
                                // display descript
                                if let weatherArray = firstDictionary.value(forKey: "weather") as? NSArray,
                                   let firstWeather = weatherArray.firstObject as? NSDictionary,
                                   let descriptValue = firstWeather.value(forKey: "description") as? String {
                                    DispatchQueue.main.async {
                                        self.descript.text = "Description: \(descriptValue)"
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
        }
                
                
                task1.resume()
                
            }
    // Defines an action triggered when the button is tapped.
    @IBAction func navigateToMapTapped(_ sender: UIButton) {
                
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
                let nextScreen = segue.destination as! StaticMapViewController
                
                nextScreen.title = cityTextField.text
                nextScreen.lat = latitude
                nextScreen.long = longitude
                nextScreen.temp = temperaturevalue
                nextScreen.admin = administrativeArea
                nextScreen.loc = locality
            }
    func showAlert(title: String, message: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           self.present(alert, animated: true)
       }
    
    //home button function
    @objc func homeButton1Click() {
            self.navigationController?.popToRootViewController(animated: true)
        }
    
}

