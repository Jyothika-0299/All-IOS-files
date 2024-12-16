//
//  ViewController.swift
//  TableViewWithNavigation
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tbv1 : UITableView!
    var section1Names : [String] = []
    var section1Images : [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Table view with navigation"
        section1Names = ["mumbai","china","india"]
        section1Images = ["cat.jpeg","resort.jpeg","park.jpeg"]
        tbv1.delegate = self
        tbv1.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return section1Names.count
        
    }
    //2,3.create and display the info in cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            cell1.textLabel?.text = section1Names[indexPath.row]
            cell1.imageView?.image = UIImage(named: section1Images[indexPath.row])
            cell1.backgroundColor = .clear
            //cell1.accessoryType = .disclosureIndicator
            //cell1.accessoryType = .checkmark
            //cell1.accessoryType = .detailButton
            cell1.accessoryType = .detailDisclosureButton
            cell1.tintColor = .black
            
            return cell1
            
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard1 = UIStoryboard(name: "Main", bundle: nil)
        let nextScreen = Storyboard1.instantiateViewController(withIdentifier: "storyid1") as! secondViewController
        nextScreen.string1 = section1Names[indexPath.row]
        nextScreen.image1 = UIImage(named: section1Images[indexPath.row])!
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
}
