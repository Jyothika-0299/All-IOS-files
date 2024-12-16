//
//  ViewController.swift
//  TableViewWithMultipleSectionsAndRows
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView1 : UITableView!
    @IBOutlet var tableView2 : UITableView!
    
    var Section1 : [String] = []
    var Section2 : [String] = []
    var Section3 : [String] = []
    var Section4 : [String] = []
    var Section5 : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Section1 = ["Cat","puppy","snake","lion"]
        Section2 = ["red","blue","black"]
        Section3 = ["apple","banana","custard apple"]
        Section4 = ["storybook","classbook","collegebook"]
        Section5 = ["car","bike","scooty"]
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView2.delegate = self
        tableView2.dataSource = self
    }
    //tableview protocol methods implementation
    //1.number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tableView1 {
            return 2
        } else {
            return 3
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
                   if section == 0 {
                       return Section1.count
                   }else {
                       return Section2.count
                   }
               }
               else {
                   if section == 0 {
                       return Section3.count
                   }else if section == 1 {
                       return Section4.count
                   }else {
                       return Section5.count
                   }
               }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView1 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            if indexPath.section == 0 {
               
                cell1.textLabel?.text = Section1[indexPath.row]
            } else {
                // Fill with data from array2
                cell1.textLabel?.text = Section2[indexPath.row]
            }
            return cell1
        } else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
            if indexPath.section == 0 {
               
                cell2.textLabel?.text = Section3[indexPath.row]
            } else if indexPath.section == 1 {
                
                cell2.textLabel?.text = Section4[indexPath.row]
            } else {
                cell2.textLabel?.text = Section5[indexPath.row]
            }
            return cell2
        }
    }
    
    //4.section header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == tableView1 {
            if section == 0 {
                return "Animals"
            } else {
                return "Colors"
            }
        } else {
            if section == 0 {
                return "Fruits"
            } else if section == 1{
                return "Books"
            } else {
                return "Vehicles"
            }
        }
        
    }
    //5.section footer title
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if tableView == tableView1 {
            if section == 0 {
                return "List of animals"
            } else {
                return "List of colors"
            }
        } else {
            if section == 0 {
                return "List of fruits"
            } else if section == 1{
                return "List of books"
            } else {
                return "List of vehicles"
            }
        }
        
    }
}
    
