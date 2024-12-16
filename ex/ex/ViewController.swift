import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    
    @IBOutlet var table1: UITableView!
    
    var AndriodNames: [String] = []
    var AppleNames: [String] = []
    
    
    @IBOutlet var table2: UITableView!
    
    var TollyHero: [String] = []
    var CarNames: [String] = []
    var BikleNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 2 Sections Table1
         AndriodNames = ["Samsung","ONE+","Motrola","Redmi"]
         AppleNames = ["iPhone","iWatch","iPod","iTV","iMac"]
        
         table1.delegate = self
         table1.dataSource = self
        
        
        
        // 3 Sections Table2
        TollyHero = ["Prabhas","Ram","Arjun","Allu","Nani"]
        CarNames = ["honda","maruti","kia","toyato"]
        BikleNames = ["royal","harle","suszu"]
        
        table2.delegate = self
        table2.dataSource = self
        
        
    }
    
    
    //1 method no of section
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == table1 {
            return 2
        }else {
            return 3
        }
    }
    //2 no of rows and assign section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table1 {
            if section == 0 {
                return AndriodNames.count
            }else {
                return AppleNames.count
            }
        }
        else {
            if section == 0 {
                return TollyHero.count
            }else if section == 1 {
                return CarNames.count
            }else {
                return BikleNames.count
            }
        }
    }
    
    // 3 display row info
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == table1 {
            
            if indexPath.section == 0 {
                
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
                
                cell1.textLabel?.text = AndriodNames[indexPath.row]
                cell1.accessoryType = .detailDisclosureButton
                
                return cell1
                
            }else {
                
                let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
                
                cell2.textLabel?.text = AppleNames[indexPath.row]
                cell2.accessoryType = .detailDisclosureButton
                
                return cell2
            }
            
        }else {
            
            if indexPath.section == 0 {
                
                let cell3 = tableView.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
                
                cell3.textLabel?.text = TollyHero[indexPath.row]
                cell3.accessoryType = .detailDisclosureButton
                
                return cell3
                
            }else if indexPath.section == 1 {
                
                let cell4 = tableView.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
                
                cell4.textLabel?.text = CarNames[indexPath.row]
                cell4.accessoryType = .detailDisclosureButton
                
                return cell4
            }else {
                
                let cell5 = tableView.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
                
                cell5.textLabel?.text = BikleNames[indexPath.row]
                cell5.accessoryType = .detailDisclosureButton
                
                return cell5
            }
        }
        
    }
    // 4. header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if tableView == table1 {
            
            if section == 0 {
                
                return "Andriod"
            }else {
                return "Apple"
            }
        }else {
            if section == 0 {
                return "Hero Names"
            }else if section == 1 {
                return "Cars"
            }else {
                return "Bikes"
            }
        }
    }
    //5 .footer title
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        if tableView == table1 {
            
            if section == 0 {
                
                return "Andriod End"
            }else {
                return "Apple End"
            }
        }else {
            if section == 0 {
                return "Hero Names End"
            }else if section == 1 {
                return "Cars End"
            }else {
                return "Bikes End"
            }
        }
    }
    


}


