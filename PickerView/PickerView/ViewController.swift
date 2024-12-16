//
//  ViewController.swift
//  PickerView
//
//  Created by FCI on 26/11/24.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet var pv1 : UIPickerView!
    
    @IBOutlet var l1 : UILabel!
   
    var array1 : [String] = []
    var array2 : [String] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view.
        array1 = ["imac","mini mac","mac book pro","mac book air"]
        array2 = ["iphone","ipad","ipod Touch"]
        
        
        pv1.delegate = self
        pv1.dataSource = self
       
        
        
        
    }
    
    //pickerview protocol methods implementation
    //1.no of components in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    // no of rows in a component
    func pickerView(_ pickerView:UIPickerView, numberOfRowsInComponent component:Int) -> Int {
        if component == 0 {
            return array1.count
            //return array3.count
        }
        else {
            return array2.count
            //return array4.count
        }
    }
    //displaying the array info in rows
    
    func pickerView(_ pickerView:UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return array1[row]
            //return array4[row]
            
            
        }
        else {
            return array2[row]
            //return array4[row]
        }
        
    }
    //when user select any row in component
    func pickerView(_ pickerView : UIPickerView,didSelectRow row: Int,inComponent component : Int) {
        if component == 0 {
            l1.text =  array1[row]
            //img.image = UIImage(named: array3[row])
            
        }
        else {
            l1.text = array2[row]
            //img.image = UIImage(named: array4[row])
        }
        
    }
    //row height
    func pickerView(_ pickerView : UIPickerView,rowHeightForComponent component : Int) ->CGFloat {
        return 140
    }
    //row width
    func pickerView(_ pickerView : UIPickerView,widthForComponent component : Int) ->CGFloat {
        return 180
    }



}

