//
//  ViewController.swift
//  SharingTextImageUrlusingUIActivityViewController
//
//  Created by FCI on 29/11/24.
//

import UIKit
import AVFoundation
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var tf1 : UITextField!
    @IBOutlet var tf2 : UITextField!
    @IBOutlet var img1 : UIImageView!
    @IBOutlet var ButtonTapped : UIButton!
    @IBOutlet var b2 : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func ButtonTapped(_ sender: UIButton) {
            // Create the action sheet
            let actionSheet = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
            
            // Option to open the photo library
            let photoLibraryAction = UIAlertAction(title: "Open Photo Library", style: .default) { _ in
                self.openPhotoLibrary()
            }
            
            // Option to open the camera
            let cameraAction = UIAlertAction(title: "Open Camera", style: .default) { _ in
                self.openCamera()
            }
            
            // Cancel option
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            // Add actions to the action sheet
            actionSheet.addAction(photoLibraryAction)
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(cancelAction)
            
            // Present the action sheet
            self.present(actionSheet, animated: true, completion: nil)
        }
        
        // Function to open the photo library
        func openPhotoLibrary() {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                showError(message: "Photo Library is not available.")
            }
        }
        
        // Function to open the camera
        func openCamera() {
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                showError(message: "Camera is not available.")
            }
        }
        
        // UIImagePickerControllerDelegate method to handle image selection
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                img1.image = selectedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
        
        // UIImagePickerControllerDelegate method for canceling the image picker
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
        // Function to show an error alert
        func showError(message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    @IBAction func ShareClick() {
        let text = "Sharing Details"
        let image = UIImage(named: "chicken.jpeg")
        let myWebsite = URL(string:"https://www.apple.com")
        let shareAll = [text, image!, myWebsite!] as [Any]
        print(shareAll)
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController,animated: true)
    }
}






