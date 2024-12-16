//
//  ViewController.swift
//  TableViewWithMultipleSectionsAndRows
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView1 : UITableView!
    @IBOutlet var img : UIImageView!
    @IBOutlet var l1 : UILabel!
    var Section1Names : [String] = []
    var Section1Images : [String] = []
    var Section2Names : [String] = []
    var Section2Images : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Section1Names = ["Cat","puppy","resort","park"]
        Section1Images = ["cat.jpeg","nature.jpeg","park.jpeg","cat.jpeg"]
        Section2Names = ["apple","ball","dog"]
        Section2Images = ["cat.jpeg","nature.jpeg","park.jpeg"]
        tableView1.delegate = self
        tableView1.dataSource = self
    }
    //tableview protocol methods implementation
    //1.number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Section1Names.count
        }
        else {
            return Section2Names.count
        }
    }
    //2,3.create and display the info in cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "MAC"
        }
        else {
            return "IOS"
        }
    }
    //5.section footer title
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "MAC End"
        }
        else {
            return "IOS End"
        }
        
    }
    //6.height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    //7.height for footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    //8.row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            l1.text = Section1Names[indexPath.row]
            img.image = UIImage(named: Section1Images[indexPath.row])
        }
        else {
            
            l1.text = Section2Names[indexPath.row]
            img.image = UIImage(named: Section2Images[indexPath.row])
            
        }
    }
    //10.when user select any accesory detail button
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section == 0 {
            l1.text = Section1Names[indexPath.row]
            img.image = UIImage(named: Section1Images[indexPath.row])
        }
        else {
            
            l1.text = Section2Names[indexPath.row]
            img.image = UIImage(named: Section2Images[indexPath.row])
            
        }
    }
    //11.section index titles
    func sectionIndexTitles(for tableView : UITableView) -> [String]? {
        let indexTitles = ["MAC","IOS"]
        return indexTitles
    }
    
    override func viewWillAppear(_ animated: Bool) {
            self.animateTable()
        }
        
        func animateTable() {
       tableView1.reloadData()
          let cells = tableView1.visibleCells
        let tableHeight: CGFloat = tableView1.bounds.size.height
       for i in cells {
         let cell: UITableViewCell = i as UITableViewCell
          cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
      }
       var index = 0
       for a in cells {
        let cell: UITableViewCell = a as UITableViewCell
           UIView.animate(withDuration: 1.5, delay: 0.09 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowAnimatedContent,
       animations: {
         cell.transform = CGAffineTransform(translationX: 0, y: 0);
       }, completion: nil)
       
       index += 1 }
      }
}
