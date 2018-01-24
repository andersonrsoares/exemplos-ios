//
//  ViewController.swift
//  TesteFCM
//
//  Created by DevMaker Mobile on 6/1/16.
//  Copyright © 2016 DevMaker Mobile. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showToken(sender: UIButton) {
        // [START get_iid_token]
        FIRMessaging.messaging().subscribeToTopic("general")
        print("Subscribed to news topic")
        let token = FIRInstanceID.instanceID().token()
        if(token != nil){
            print("InstanceID token: \(token!)")
        }
       
        // [END get_iid_token]
    }

}

