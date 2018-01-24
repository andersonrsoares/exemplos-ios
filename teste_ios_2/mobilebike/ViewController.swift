//
//  ViewController.swift
//  mobilebike
//
//  Created by Anderson Soares on 09/06/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let logado = NSUserDefaults.standardUserDefaults().boolForKey("logado")
        //if (!logado){
            self.performSegueWithIdentifier("loginView", sender: self)
       // }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sair(sender: UIButton) {
        self.performSegueWithIdentifier("loginView", sender: self)
    }

}

