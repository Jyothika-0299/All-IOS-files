//
//  ViewController.swift
//  Sending Emails and SMS
//
//  Created by FCI on 29/11/24.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet var b1 : UIButton!
    @IBOutlet var b2 : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func b1Click() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["test@test.test"])
            mail.setSubject("Greeting")
            mail.setMessageBody("<p>Good Morning!</p>", isHTML: true)
            present(mail, animated: true)
        }
        
    }
    func mailComposeController(_ controller:MFMailComposeViewController,didFinishWith result: MFMailComposeResult, error: Error?) {
        switch (result) {
        case .cancelled:
            print("mail was cancelled")
            dismiss(animated: true)
        case .failed:
            print("Mail failed")
            dismiss(animated: true)
        case .sent:
            print("Mail was sent")
            dismiss(animated: true)
        default:
            break
          
        }
    }
    @IBAction func b2Click() {
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Happy birthday"
            controller.recipients = ["0123456789"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
          
    
    }
func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    switch(result) {
    case .cancelled:
        print("message was cancelled")
        dismiss(animated: true)
    case .failed:
        print("Message  failed")
        dismiss(animated: true)
    case .sent:
        print("Message was sent")
        dismiss(animated: true, completion : nil)
    default:
        break
        
    }

    }
    
}

