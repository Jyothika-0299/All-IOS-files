//
//  ViewController.swift
//  DownloadingImagesUsingDispatchQueues
//
//  Created by FCI on 04/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView0 : UIImageView!
    @IBOutlet var imageView1 : UIImageView!
    @IBOutlet var imageView2 : UIImageView!
    @IBOutlet var activityIndicatorView0 : UIActivityIndicatorView!
    @IBOutlet var activityIndicatorView1 : UIActivityIndicatorView!
    @IBOutlet var activityIndicatorView2 : UIActivityIndicatorView!
    @IBOutlet var downloadSerialButton : UIButton!
    @IBOutlet var downloadConcurrentButton : UIButton!
    private let serialDispatchQueue = DispatchQueue(label: "serial-dispatch-queue")
    private let concurrentDispatchQueue = DispatchQueue(label: "concurrent-dispatch-queue", attributes: .concurrent)
        
        // MARK: - Actions

        @IBAction func downloadSerial(_ sender: Any) {
            download(using: serialDispatchQueue)
        }
        
        @IBAction func downloadConcurrent(_ sender: Any) {
            download(using: concurrentDispatchQueue)
        }
        
        // MARK: - Helper Methods
        
        private func download(using dispatchQueue: DispatchQueue) {
            // Reset Image Views
            imageView0.image = nil
            imageView1.image = nil
            imageView2.image = nil
            
            // Define URLs
            let url0 = URL(string: "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-0.jpg")
            let url1 = URL(string: "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-1.jpg")
            let url2 = URL(string: "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-2.jpg")
            
            // Show Activity Indicator Views
            activityIndicatorView0.startAnimating()
            activityIndicatorView1.startAnimating()
            activityIndicatorView2.startAnimating()
            
            dispatchQueue.async { [weak self] in
                guard let url = url0 else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self?.imageView0.image = image
                    self?.activityIndicatorView0.stopAnimating()
                    self?.activityIndicatorView0.isHidden = true
                }
            }
            
            dispatchQueue.async { [weak self] in
                guard let url = url1 else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self?.imageView1.image = image
                    self?.activityIndicatorView1.stopAnimating()
                    self?.activityIndicatorView1.isHidden = true
                }
            }
            
            dispatchQueue.async { [weak self] in
                guard let url = url2 else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self?.imageView2.image = image
                    self?.activityIndicatorView2.stopAnimating()
                    self?.activityIndicatorView2.isHidden = true
                }
            }
        }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    


}

