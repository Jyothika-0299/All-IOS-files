//
//  ViewController.swift
//  Coredata
//
//  Created by FCI on 03/12/24.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    @IBOutlet var entername : UITextField!
    @IBOutlet var enteraddress : UITextField!
    @IBOutlet var enterphno : UITextField!
    @IBOutlet var label1 : UILabel!
    @IBOutlet var savebutton : UIButton!
    @IBOutlet var findbutton : UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func savebuttonClick() {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(entername.text, forKey: "name")
        newUser.setValue(enteraddress, forKey: "address")
        newUser.setValue(enterphno, forKey: "phno")
        do {
            try context.save()
            entername.text = ""
            enteraddress.text = ""
            enterphno.text = ""
            label1.text = "Contact saved"
            
        } catch {
            print("failed saving")
            label1.text = "failed contact saved"
        }
        
    }
    @IBAction func findbuttonClick() {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        request.predicate = NSPredicate(format: "name=%@", entername.text!)
        do {
            let result  = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                enteraddress.text = data.value(forKey: "address") as? String
                enterphno.text = data.value(forKey: "phno") as? String
                label1.text = "Matches found: \(result.count)"
                
            }
        } catch {
                print("failed")
                label1.text = "Failed contact saved"
            }
        }
}




