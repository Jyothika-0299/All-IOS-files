//
//  ViewController.swift
//  OpeartionQueues
//
//  Created by FCI on 04/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var iv1 : UIImageView!
    @IBOutlet var iv2 : UIImageView!
    @IBOutlet var iv3 : UIImageView!
    @IBOutlet var iv4 : UIImageView!
    
    @IBOutlet var button1 : UIButton!
    @IBOutlet var button2 : UIButton!

    let imageURLs = ["https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-2.jpg", "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-0.jpg", "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-1.jpg", "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-0.jpg", "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-1.jpg", "https://cdn.cocoacasts.com/3cbae1d5e178606580518a81da69e5af30a7bb5b/image-2.jpg"]
        
        var queue1: OperationQueue!
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        func downloadImageWithURL(url:String) -> UIImage! {
            
            let data = NSData(contentsOf: NSURL(string: url)! as URL)
            return UIImage(data: data! as Data)
        }

        @IBAction func button1Click() {
            
            queue1 = OperationQueue()
            
            // First Operation
            
            let operation1 = BlockOperation(block: {
                let img1 = self.downloadImageWithURL(url: self.imageURLs[0])
                OperationQueue.main.addOperation {
                    self.iv1.image = img1
                }
            })
            
            operation1.completionBlock = {
                print("Operation 1 completed, cancelled:\(operation1.isCancelled)")
            }
            
            queue1.addOperation(operation1)
            
            // secnond Operation
            
            let operation2 = BlockOperation(block: {
                let img2 = self.downloadImageWithURL(url: self.imageURLs[1])
                OperationQueue.main.addOperation {
                    self.iv2.image = img2
                }
            })
            
            operation2.completionBlock = {
                print("Operation 2 completed, cancelled:\(operation2.isCancelled)")
            }
            queue1.addOperation(operation2)
            
           // operation1.addDependency(operation2)
            
            // Third Operation
            
            let operation3 = BlockOperation(block: {
                let img3 = self.downloadImageWithURL(url: self.imageURLs[2])
                OperationQueue.main.addOperation {
                    self.iv3.image = img3
                }
            })
            
            operation3.completionBlock = {
                print("Operation 3 completed, cancelled:\(operation3.isCancelled)")
            }
            queue1.addOperation(operation3)
            
         //   operation2.addDependency(operation3)
            
            // Fourth Operation
            
            let operation4 = BlockOperation(block: {
                let img4 = self.downloadImageWithURL(url: self.imageURLs[3])
                OperationQueue.main.addOperation {
                    self.iv4.image = img4
                }
            })
            
            operation4.completionBlock = {
                print("Operation 4 completed, cancelled:\(operation4.isCancelled)")
            }
            queue1.addOperation(operation4)

           // operation3.addDependency(operation4)
        }
        
        @IBAction func button2Click() {
            
            self.queue1.cancelAllOperations()
        }

    }
    




