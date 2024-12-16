//
//  firstTableViewController.swift
//  Exam2.2
//
//  Created by FCI on 28/11/24.
//
//


import UIKit

class firstTableViewController: UITableViewController {
    
    var Section1Names : [String] = []
    var Section1Images : [String] = []
    var Section1Textinfo : [String] = []
    var Section2Names : [String] = []
    var Section2Images : [String] = []
    var Section2Textinfo : [String] = []
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Section1Names = ["Mushroom","Panner","Brinjal"]
        Section1Images = ["mushroom.jpeg","panner.jpeg","brinjal.jpeg"]
        Section1Textinfo = ["mushroom.txt","panner.txt","Brinjal.txt"]
        Section2Names = ["Chicken","Fish","Mutton"]
        Section2Images = ["chicken.jpeg","fish.jpeg","mutton.jpeg"]
        Section2Textinfo = ["chicken.txt","fish.txt","mutton.txt"]
        
    }
    
    //1 method no of section
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    //2 no of rows and assign section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if section == 0 {
            return Section1Names.count
        }else {
            return Section2Names.count
        }
    }
            
    
    // 3 display row info
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = Section1Names[indexPath.row]
            cell1.accessoryType = .detailDisclosureButton
            
            
            return cell1
            
            
        }else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            cell2.textLabel?.text = Section2Names[indexPath.row]
            cell2.accessoryType = .detailDisclosureButton
            return cell2
            
            
            
        }
    }
    
    
    // 4. header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "VEG RECIPES"
        }else {
            return "NON VEG RECIPIES"
        }
    }
    
    
    
    //5. Footer title
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "List of Veg recipes"
        }else {
            return "List of non veg recipes"
        }
    }

        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nextScreen = storyboard.instantiateViewController(withIdentifier: "storyid1") as! ViewController
        
        
        if indexPath.section == 0 {
            
            nextScreen.title = Section1Names[indexPath.row]
            nextScreen.string1 = Section1Textinfo[indexPath.row]
            nextScreen.image1 = UIImage(named: Section1Images[indexPath.row])!
            
            
        } else {
            
            nextScreen.title = Section2Names[indexPath.row]
            nextScreen.string1 = Section2Textinfo[indexPath.row]
            nextScreen.image1 = UIImage(named: Section2Images[indexPath.row])!
        }
        self.navigationController?.pushViewController(nextScreen, animated: true)
        
        
    }
    
}

    
    



    

    

   


    

    
