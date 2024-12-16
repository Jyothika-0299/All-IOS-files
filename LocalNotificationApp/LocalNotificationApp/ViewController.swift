//
//  ViewController.swift
//  LocalNotificationApp
//
//  Created by FCI on 29/11/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    @IBOutlet var b1 : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge],completionHandler: {didAllow, error in
        })
    }
    @IBAction func b1Click() {
        let content = UNMutableNotificationContent()
        content.title = "Sudhaksha"
        content.subtitle = "Apple ios development"
        content.body = "we are learning about ios"
        content.badge = 1
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler  completionHandler: @escaping(UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }


}

