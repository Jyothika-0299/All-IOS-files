//
//  ViewController.swift
//  pickerViewTask
//
//  Created by FCI on 27/11/24.
//



import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet var pv1 : UIPickerView!
    @IBOutlet var img : UIImageView!
    let imgNames1 = ["cat.jpeg","park.jpeg"]
    let imgNames2 = ["resort.jpeg","pup.jpeg"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.image = UIImage(named: imgNames1[0])
       
        img.image = UIImage(named: imgNames2[0])
        
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
            return imgNames1.count
        }
        else {
            //return array2.count
            return imgNames2.count
        }
    }
    //displaying the array info in rows
    
    func pickerView(_ pickerView:UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            //return array1[row]
            return imgNames1[row]
            
            
        }
        else {
            //return array2[row]
            return imgNames2[row]
        }
        
    }
    //when user select any row in component
    func pickerView(_ pickerView : UIPickerView,didSelectRow row: Int,inComponent component : Int) {
        if component == 0 {
            //l1.text =  array1[row]
            img.image = UIImage(named: imgNames1[row])
            
        }
        else {
            //l1.text = array2[row]
            img.image = UIImage(named: imgNames2[row])
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
