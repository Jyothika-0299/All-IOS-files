//
//  ViewController.swift
//  WebSeriveswithJSONParsing
//
//  Created by FCI on 03/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var sendRequestButton:UIButton!
    @IBOutlet var textfield1 : UITextField!
    @IBOutlet var l1 : UILabel!
    @IBOutlet var l2 : UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sendRequestButtonClick() {
        // 1. preparing the url
                
                let session1 = URLSession.shared
                
                let webserviceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(textfield1.text!)&APPID=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
                
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
                               print("\(self.textfield1.text!): \(temperaturevalue)°C")
                                    self.l1.text = "\(self.textfield1.text!) Temperature: \(temperaturevalue)°C"
                                                        }
                                                        }
                            
                            if let humidityValue = secondDictionary.value(forKey: "humidity") {
                                    DispatchQueue.main.async {
                                   print("\(self.textfield1.text!): \(humidityValue)°C")
                                self.l2.text = "\(self.textfield1.text!) Humidity: \(humidityValue)"
                                                            }
                                                            }
                            
                            
                            
                        }
                        
                 }
                            
                        }
                    }
                }
                
                
                task1.resume()

            }
}

