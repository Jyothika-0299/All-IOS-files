import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var reverseGeocodeButton: UIButton!
    @IBOutlet weak var forwardGeocodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Action when reverse geocoding button is tapped
    @IBAction func reverseGeocodeTapped(_ sender: UIButton) {
        let FirstVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        navigationController?.pushViewController(FirstVC, animated: true)
    }
    
    // Action when forward geocoding button is tapped
    @IBAction func forwardGeocodeTapped(_ sender: UIButton) {
        let SecondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        navigationController?.pushViewController(SecondVC, animated: true)
    }
}

