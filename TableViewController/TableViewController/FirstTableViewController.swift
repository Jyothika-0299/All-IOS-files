//
//  FirstTableViewController.swift
//  TableViewController
//
//  Created by FCI on 27/11/24.
//

import UIKit

class FirstTableViewController: UITableViewController {
    var Section1Names : [String] = []
    var Section1Images : [String] = []
    var Section2Names : [String] = []
    var Section2Images : [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        Section1Names = ["Cat","puppy","resort","park"]
        Section1Images = ["cat.jpeg","nature.jpeg","park.jpeg","cat.jpeg"]
        Section2Names = ["apple","ball","dog"]
        Section2Images = ["cat.jpeg","nature.jpeg","park.jpeg"]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return Section1Names.count
        }
        else {
            return Section2Names.count
        }
    }
    //2,3.create and display the info in cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            cell1.textLabel?.text = Section1Names[indexPath.row]
            cell1.imageView?.image = UIImage(named: Section1Images[indexPath.row])
            cell1.backgroundColor = .clear
            //cell1.accessoryType = .disclosureIndicator
            //cell1.accessoryType = .checkmark
            //cell1.accessoryType = .detailButton
            cell1.accessoryType = .detailDisclosureButton
            cell1.tintColor = .black
            
            return cell1
            
        }
        else {
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            cell2.textLabel?.text = Section2Names[indexPath.row]
            cell2.imageView?.image = UIImage(named: Section2Images[indexPath.row])
            cell2.backgroundColor = .yellow
            //cell2.accessoryType = .disclosureIndicator
            cell2.accessoryType = .detailDisclosureButton
            cell2.tintColor = .blue
            
            return cell2
            
        }
    }
    
    //4.section header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "MAC"
        }
        else {
            return "IOS"
        }
    }
    //5.section footer title
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "MAC End"
        }
        else {
            return "IOS End"
        }
        
    }
    //6.height for header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    //7.height for footer
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    //8.row height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                return 150
            }
            
            return 60
        }
        else {
            return 100
        }
    }
    //9.whe user select any row in tableview
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            //l1.text = Section1Names[indexPath.row]
            //img.image = UIImage(named: Section1Images[indexPath.row])
        }
        else {
            
            //l1.text = Section2Names[indexPath.row]
            //img.image = UIImage(named: Section2Images[indexPath.row])
            
        }
    }
    //10.when user select any accesory detail button
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section == 0 {
            //l1.text = Section1Names[indexPath.row]
            //img.image = UIImage(named: Section1Images[indexPath.row])
        }
        else {
            
            //l1.text = Section2Names[indexPath.row]
            //img.image = UIImage(named: Section2Images[indexPath.row])
            
        }
    }
    //11.section index titles
    override func sectionIndexTitles(for tableView : UITableView) -> [String]? {
        let indexTitles = ["MAC","IOS"]
        return indexTitles
    }
}


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


