//
//  BookingViewController.swift
//  JyothikaFinalProject
//
//  Created by FCI on 11/12/24.
//


// Imports the framework, which provides the necessary infrastructure for iOS apps.
import UIKit
import SafariServices
import WebKit
import QuartzCore

// Defines a ViewController class that manages the app's user interface.
class BookingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // Connects below different UIObjects from the storyboard to this code.
    @IBOutlet var tableView : UITableView!
    @IBOutlet var image : UIImageView!
    @IBOutlet var webName : UILabel!
    @IBOutlet var webURL : UILabel!
    @IBOutlet var NextButton : UIButton!
    //core animation
    var labelLayer : CALayer!
    var Button : CALayer!
    var imageviewLayer : CALayer!
    var screenviewLayer : CALayer!
    

    // Defining sections along with row data
    //section 1 : bus booking application names, url, logos
    var Section1Names : [String] = ["RedBus", "AbhiBus", "Goibibo"]
    var Section1URL : [String] = ["https://www.redbus.in","https://www.abhibus.com", "https://www.goibibo.com/bus/"]
    var Section1Images : [String] = ["RedBus.png", "AbhiBus.png", "Goibibo.png"]
    //section 2 : train booking application names, url, logos
    var Section2Names : [String] = ["GoTrain", "IRCTC", "Trainline"]
    var Section2URL : [String] = ["https://www.gotrain.com","https://www.irctc.co.in","https://www.thetrainline.com"]
    var Section2Images : [String] = ["GoTrain.jpeg", "IRCTC.png", "Trainline.png"]
    //section 3 : movies booking application names, url, logos
    var Section3Names : [String] = ["BookMyShow", "Inox", "PVR Cinemas"]
    var Section3URL : [String] = ["https://www.bookmyshow.com","https://www.inoxmovies.com", "https://www.pvrcinemas.com"]
    var Section3Images : [String] = ["BookMyShow.jpeg", "Inox.jpeg", "PVR Cinemas.jpeg"]
    //section 4 : cab booking application names, url, logos
    var Section4Names : [String] = ["Uber", "Ola", "Taxify"]
    var Section4URL : [String] = ["https://www.uber.com","https://www.olacabs.com","https://www.taxify.com"]
    var Section4Images : [String] = ["Uber.png", "Ola.png", "Taxify.png"]
    //section 5 : flight booking application names, url, logos
    var Section5Names : [String] = ["Skyscanner", "Kayak", "Expedia"]
    var Section5URL : [String] = ["https://www.skyscanner.com","https://www.kayak.com", "https://www.expedia.com"]
    var Section5Images : [String] = ["Skyscanner.png", "Kayak.png", "Expedia.png"]
    
    
    // Called when the view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        //core animation for imageview
        imageviewLayer = image.layer
        imageviewLayer.borderColor = UIColor.black.cgColor
        imageviewLayer.borderWidth = 5
        imageviewLayer.cornerRadius = 25
        imageviewLayer.shadowRadius = 100
        imageviewLayer.shadowColor = UIColor.black.cgColor
        //core animation for webname label
        labelLayer = webName.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for weburl label
        labelLayer = webURL.layer
        labelLayer.borderColor = UIColor.black.cgColor
        labelLayer.borderWidth = 2
        labelLayer.cornerRadius = 5
        //labelLayer.backgroundColor = UIColor.purple.cgColor
        //core animation for next button
        Button = NextButton.layer
        Button.borderColor = UIColor.black.cgColor
        Button.borderWidth = 2
        Button.cornerRadius = 5
        //Button.backgroundColor = UIColor.yellow.cgColor
        //core animation for screen view layer
        screenviewLayer = self.view.layer
        //screenviewLayer.borderColor = UIColor.systemPink.cgColor
        //screenviewLayer.borderWidth = 10
        screenviewLayer.cornerRadius = 50
        
        // Do any additional setup after loading the view.
        if tableView == nil {
            print("tableView is nil. Check storyboard connections.")
        } else {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    //tableview protocol methods implementation
    //1.number of sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    //2.number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return Section1Names.count
        }else if section == 1 {
            return Section2Names.count
        }else if section == 2 {
            return Section3Names.count
        } else if section == 3 {
            return Section4Names.count
        } else {
            return Section5Names.count
        }
    }
    
    //3.title for header section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Bus"
        } else if section == 1 {
            return "Train"
        } else if section == 2 {
            return "Movie"
        } else if section == 3 {
            return "Cabs"
        } else {
            return "Flight"
        }
        
    }
    
    //4.title for footer section
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Buses End"
        } else if section == 1 {
            return "Trains End"
        } else if section == 2 {
            return "Movies End"
        } else if section == 3 {
            return "Cabs End"
        } else {
            return "Flight End"
        }
    }
    //5.display the info in cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = Section1Names[indexPath.row]
        } else if indexPath.section == 1 {
            
            cell.textLabel?.text = Section2Names[indexPath.row]
        } else if indexPath.section == 2 {
            
            cell.textLabel?.text = Section3Names[indexPath.row]
        } else if indexPath.section == 3 {
            
            cell.textLabel?.text = Section4Names[indexPath.row]
        } else {
            cell.textLabel?.text = Section5Names[indexPath.row]
        }
        cell.accessoryType = .detailDisclosureButton
        //cell.backgroundColor = .clear
        cell.tintColor = .black
        return cell
        
    }
    //6.height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    //7.height for footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    //8.whe user select any row in tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            webName.text = Section1Names[indexPath.row]
            image.image = UIImage(named: Section1Images[indexPath.row])
            webURL.text = Section1URL[indexPath.row]
        }
        else if indexPath.section == 1 {
            
            webName.text = Section2Names[indexPath.row]
            image.image = UIImage(named: Section2Images[indexPath.row])
            webURL.text = Section2URL[indexPath.row]
        }
        else if indexPath.section == 2 {
            
            webName.text = Section3Names[indexPath.row]
            image.image = UIImage(named: Section3Images[indexPath.row])
            webURL.text = Section3URL[indexPath.row]
        }
        else if indexPath.section == 3 {
            
            webName.text = Section4Names[indexPath.row]
            image.image = UIImage(named: Section4Images[indexPath.row])
            webURL.text = Section4URL[indexPath.row]
        } else {
            webName.text = Section5Names[indexPath.row]
            image.image = UIImage(named: Section5Images[indexPath.row])
            webURL.text = Section5URL[indexPath.row]
        }
        
    }
    //09.when user select any accesory detail button
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section == 0 {
            webName.text = Section1Names[indexPath.row]
            image.image = UIImage(named: Section1Images[indexPath.row])
            webURL.text = Section1URL[indexPath.row]
        }
        else if indexPath.section == 1 {
            webName.text = Section2Names[indexPath.row]
            image.image = UIImage(named: Section2Images[indexPath.row])
            webURL.text = Section2URL[indexPath.row]
            
        }
        else if indexPath.section == 2 {
            webName.text = Section3Names[indexPath.row]
            image.image = UIImage(named: Section3Images[indexPath.row])
            webURL.text = Section3URL[indexPath.row]
            
        }
        else if indexPath.section == 3 {
            webName.text = Section4Names[indexPath.row]
            image.image = UIImage(named: Section4Images[indexPath.row])
            webURL.text = Section4URL[indexPath.row]
            
        }
        else {
            webName.text = Section5Names[indexPath.row]
            image.image = UIImage(named: Section5Images[indexPath.row])
            webURL.text = Section5URL[indexPath.row]
        }
        
    }
    //10.section index titles
    func sectionIndexTitles(for tableView : UITableView) -> [String]? {
        let indexTitles = ["BUS","TRAIN","MOVIES","CABS","FLIGHT"]
        return indexTitles
    }
    
    
    
    // Defines an action triggered when the button is tapped.
    @IBAction func NextButtonClick() {
        guard let urlString = webURL.text,!urlString.isEmpty, let url = URL(string: urlString), UIApplication.shared.canOpenURL(url)
        else {
            showAlert(title : "Error", message: "The URL is invalid or missing.")
            return
        }
        //defining actionsheet with multiple options like webview, safari
        let alert = UIAlertController(title: "Open url", message: "Please select an option", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Webkit view", style: .default, handler: {_ in
            let secondVC = WebsiteViewController()
            secondVC.url = url
            secondVC.title = self.webName.text
            secondVC.loadInWebView = true
            self.navigationController?.pushViewController(secondVC, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "safari view", style: .default, handler: { [weak self]_ in
            let secondVC = WebsiteViewController()
            secondVC.url = url
            secondVC.title = self?.webName.text
            secondVC.loadInWebView = false
            self?.navigationController?.pushViewController(secondVC, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "cancel", style: .destructive, handler: { _ in
            print("user clicked cancel button..!")
        }))
        
        //display alert
        self.present(alert, animated: true, completion: nil)
        print("completion block")
    
    }
    
    func showAlert(title : String, message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //tableview animation
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
            self.animateTable()
        }
        
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
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
