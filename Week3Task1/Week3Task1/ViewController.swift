//
//  ViewController.swift
//  Week3Task1
//
//  Created by FCI on 06/12/24.
//

import UIKit
import AVFoundation
import Photos


class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var tf1 : UITextField!
    @IBOutlet var tf2 : UITextField!
    @IBOutlet var img1 : UIImageView!
    @IBOutlet var ButtonTapped : UIButton!
    @IBOutlet var ShareButton : UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func ButtonTapped(_ sender: UIButton) {

            let actionSheet = UIAlertController(title: "Select any option", message: nil, preferredStyle: .actionSheet)
            
        
            let photoLibraryAction = UIAlertAction(title: " Photo Library", style: .default) { _ in
                self.PhotoLibrary()
            }
            
        
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
                self.Camera()
            }
            
           
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
         
            actionSheet.addAction(photoLibraryAction)
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(cancelAction)
            
           
            self.present(actionSheet, animated: true, completion: nil)
        }
        
      
        func PhotoLibrary() {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                showError(message: "Photo Library is not available.")
            }
        }
        
   
        func Camera() {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                showError(message: "Camera is not available.")
            }
        }
        

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                img1.image = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
      
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
    
        func showError(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    @IBAction func ShareClick() {
        let text = tf1.text ?? "Text not provided"
        let image = img1.image
        var myWebsite: URL?
        if let webText = tf2.text, let url = URL(string: webText) {
            myWebsite = url
        } else {
            print("Invalid URL")
        }
        let shareAll = [text, image!, myWebsite!] as [Any]
        print(shareAll)
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated: true)
    }
}

