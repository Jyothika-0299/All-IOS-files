//
//  ViewController.swift
//  Week3Task2
//
//  Created by FCI on 07/12/24.
//


import UIKit
import CoreLocation
import QuartzCore

class ViewController: UIViewController {
    
    // MARK: - Outlets
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
    
    let locationManager = CLLocationManager()
    var latitude: String!
    var longitude: String!
    var temperaturevalue: String!
    var administrativeArea: String!
    var locality: String!
    
    var labelLayer : CALayer!
    var textfieldLayer : CALayer!
    var Button : CALayer!
    var screenviewLayer : CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelLayer = latitudeLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 20
        labelLayer.backgroundColor = UIColor.purple.cgColor
        //label 2
        labelLayer = longitudeLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 20
        labelLayer.backgroundColor = UIColor.purple.cgColor
        // label 3
        labelLayer = details.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 20
        labelLayer.backgroundColor = UIColor.purple.cgColor
        //label 4
        labelLayer = temperatureLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 20
        labelLayer.backgroundColor = UIColor.purple.cgColor
        // label 5
        labelLayer = humidityLabel.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 20
        labelLayer.backgroundColor = UIColor.purple.cgColor
        //label 6
        labelLayer = wind.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 20
        labelLayer.backgroundColor = UIColor.purple.cgColor
        // label 6
        labelLayer = descript.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 20
        labelLayer.backgroundColor = UIColor.purple.cgColor
        //text field layer
        textfieldLayer = cityTextField.layer
        textfieldLayer.borderColor = UIColor.black.cgColor
        textfieldLayer.borderWidth = 2
        textfieldLayer.cornerRadius = 13
        textfieldLayer.backgroundColor = UIColor.systemRed.cgColor
        //button layer
        Button = fetchWhetherTapped.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 30
        Button.backgroundColor = UIColor.yellow.cgColor
        //button layer
        Button = navigateToMapTapped.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 20
        Button.backgroundColor = UIColor.yellow.cgColor
        //screen view layer
        screenviewLayer = self.view.layer
        screenviewLayer.borderColor = UIColor.systemPink.cgColor
        screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        
    }
    
    @IBAction func fetchWhetherTapped(_ sender: UIButton) {
        // 1. preparing the url
        
        let session1 = URLSession.shared
        
        let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(cityTextField.text!)&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
        
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
            
    @IBAction func navigateToMapTapped(_ sender: UIButton) {
                
            }
            
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
                let nextScreen = segue.destination as! SecondViewController
                
                nextScreen.title = cityTextField.text
                nextScreen.lat = latitude
                nextScreen.long = longitude
                nextScreen.temp = temperaturevalue
                nextScreen.admin = administrativeArea
                nextScreen.loc = locality
            }
}
