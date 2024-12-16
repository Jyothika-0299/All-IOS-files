//
//  ViewController.swift
//  PickerviewandDatePickerTextFields
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var tf1 : UITextField!
    @IBOutlet weak var tf2 : UITextField!
    var pv1 : UIPickerView!
    var listOfCountries : [String] = []
    var dp1: UIDatePicker!
    var df1 : DateFormatter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listOfCountries = ["india","usa","dubai","telangana","Ap"]
        pv1 = UIPickerView()
        pv1.backgroundColor = .yellow
        pv1.delegate = self
        pv1.dataSource = self
        tf1.inputView = pv1
    // date picker code
        dp1 = UIDatePicker()
        dp1.backgroundColor = .red
        dp1.preferredDatePickerStyle = .wheels
        dp1.datePickerMode = .dateAndTime
        dp1.addTarget(self, action: #selector(dp1Click), for: .valueChanged)
        tf2.inputView = dp1
   }
    @objc func dp1Click() {
        df1 = DateFormatter()
        df1.dateStyle = .medium
        df1.timeStyle = .medium
        tf2.text = df1.string(from: dp1.date)
    }
    
    
    //picker view protocol methods implementation
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView : UIPickerView, numberOfRowsInComponent component : Int) -> Int {
        return listOfCountries.count
    }
    func pickerView(_ pickerView : UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listOfCountries[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tf1.text = listOfCountries[row]
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    override func touchesBegan(_ touches : Set<UITouch>, with event: UIEvent?) {
        tf1.resignFirstResponder()
        tf2.resignFirstResponder()
    }



}


