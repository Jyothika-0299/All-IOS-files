//
//  ViewController.swift
//  AccessingPhotoLibraryandCamera
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var img : UIImageView!
    @IBOutlet var b1 : UIButton!
    @IBOutlet var b2 : UIButton!
    @IBOutlet var b3 : UIButton!
    var PhotoLibraryImagePicker1 : UIImagePickerController!
    var cameraImagePicker2 : UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func b1click() {
        // code to open photolibrary
        PhotoLibraryImagePicker1 = UIImagePickerController()
        PhotoLibraryImagePicker1 .sourceType = .photoLibrary
        PhotoLibraryImagePicker1.delegate = self
        PhotoLibraryImagePicker1.allowsEditing = true
        self.present(PhotoLibraryImagePicker1,animated: true)
    }
    @IBAction func b2click() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            cameraImagePicker2 = UIImagePickerController()
            cameraImagePicker2.delegate = self
            cameraImagePicker2.sourceType = .camera
            cameraImagePicker2.cameraDevice = .rear
            cameraImagePicker2.allowsEditing = true
            self.present(cameraImagePicker2,animated: true)
            UIImageWriteToSavedPhotosAlbum(img.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        else {
            print("camera not found in simulator")
        }
        
    }
    @IBAction func b3click() {
        UIImageWriteToSavedPhotosAlbum(img.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if picker == PhotoLibraryImagePicker1 {
            print("selected image details: \(info)")
            let image1 = info[.editedImage] as! UIImage
            img.image = image1
            self.dismiss(animated: true,completion: nil)
            
        }
        else {
            print("selected image details: \(info)")
            let image2 = info[.editedImage] as! UIImage
            img.image = image2
            self.dismiss(animated: true,completion: nil)
            
        }
        
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        if picker == PhotoLibraryImagePicker1 {
            self.dismiss(animated: true)
        }
        else {
            self.dismiss(animated: true)
        }
    }
    @objc func image(_ image: UIImage, didFinishSavingWithError error : Error?,contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message:error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message:"altered image saved to photos", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
}
