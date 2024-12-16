//
//  ViewController.swift
//  GesturesApp
//
//  Created by FCI on 02/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
         // 1.tap gesture
         let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
         tap.numberOfTapsRequired = 1
         self.img.addGestureRecognizer(tap)
         */
        /*
         //2.Long pressed gesture
         let longPressed:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPressed(_:)))
         longPressed.minimumPressDuration = 3
         self.img.addGestureRecognizer(longPressed)
         */
        /*
         //3.rotation gesture
         let rotation:UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(self.handleRotation(_:)))
         self.img.addGestureRecognizer(rotation)
         */
        /*
         //4.pinch gesture
         let pinch:UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.handlepinch(_:)))
         self.img.addGestureRecognizer(pinch)
         */
        /*
         //5.pan gesture
         let pan:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.handlepan(_:)))
         self.img.addGestureRecognizer(pan)
         */
        //6 . swipe gesture
        let rightswipe:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(_:)))
        rightswipe.direction = .right
        self.img.addGestureRecognizer(rightswipe)
        let leftswipe:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(_:)))
        leftswipe.direction = .left
        self.img.addGestureRecognizer(leftswipe)
        let upswipe:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(_:)))
        upswipe.direction = .up
        self.img.addGestureRecognizer(upswipe)
        let downswipe:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleswipe(_:)))
        downswipe.direction = .down
        self.img.addGestureRecognizer(downswipe)
        
    }
    /*
     // 1. tap gesture implementation
     @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
     print("view tapped")
     self.view.backgroundColor = .yellow
     }
     */
    /*
     //2. long pressed implementation
     @objc func handleLongPressed(_ sender:UILongPressGestureRecognizer? = nil) {
     print("long press detected")
     self.view.backgroundColor = .purple
     }
     */
    /*
     //3. rotation gesture implementation
     @objc func handleRotation(_ sender:UIRotationGestureRecognizer? = nil) {
     print("Rotation is detected")
     sender?.view?.transform = (sender?.view!.transform.rotated(by: sender!.rotation))!
     sender!.rotation = 0
     print(sender?.view?.transform)
     
     }
     */
    /*
     //4.pinch gesture implementation
     @objc func handlepinch(_ sender:UIPinchGestureRecognizer? = nil) {
     print("pinch is detected")
     sender?.view!.transform = (sender?.view?.transform.scaledBy(x: sender!.scale, y: sender!.scale))!
     sender?.scale = 1.0
     
     
     }
     */
    /*
     //5. pan gesture implementation
     @objc func handlepan(_ sender:UIPanGestureRecognizer? = nil) {
     print("pan is detected")
     let translation = sender?.translation(in: self.view)
     sender?.view!.center = CGPoint(x: (sender?.view!.center.x)! + translation!.x, y:(sender?.view!.center.y)! + translation!.y)
     sender?.setTranslation(CGPoint.zero, in: self.view)
     }
     */
    //6.swipe gesture implementation
    @objc func handleswipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .right:
            print("Right swipe")
            self.view.backgroundColor = .red
        case .left:
            print("left swipe")
            self.view.backgroundColor = .purple
        case .down:
            print("down swipe")
            self.view.backgroundColor = .blue
        case .up:
            print("up swipe")
            self.view.backgroundColor = .gray
        default:
            break
            
        }
    }
}

