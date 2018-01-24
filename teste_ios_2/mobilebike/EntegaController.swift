//
//  EntegaController.swift
//  mobilebike
//
//  Created by Anderson Soares on 10/06/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//

import UIKit

class EntegaController: UITableViewController,UITextFieldDelegate {
    
    var checkpoints = [Checkpoint]()
    var checkpointsview = [CheckpointView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkpoints.append(Checkpoint())
        checkpoints.append(Checkpoint())
        
        checkpointsview.append(CheckpointView())
        checkpointsview.append(CheckpointView())
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pedir(sender: UIBarButtonItem) {
        for i in 0..<checkpoints.count-1 {
            checkpoints[i].addressStreet = checkpointsview[i].rua?.text;
            checkpoints[i].addressNumber = checkpointsview[i].numero?.text;
            checkpoints[i].addressCity = checkpointsview[i].cidade?.text;
            checkpoints[i].description = checkpointsview[i].descricao?.text;
        }
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return checkpoints.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        //cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        let rua = cell.contentView.viewWithTag(1) as? UITextField;
        let numero = cell.contentView.viewWithTag(2) as? UITextField;
        let cidade = cell.contentView.viewWithTag(3) as? UITextField;
        let descricao = cell.contentView.viewWithTag(4) as? UITextField;
        
        checkpointsview[indexPath.row].rua  = rua
        checkpointsview[indexPath.row].numero = numero
        checkpointsview[indexPath.row].cidade = cidade
        checkpointsview[indexPath.row].descricao = descricao
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueFinalizar") {
            let svc = segue.destinationViewController as! FinalizarController;
            svc.checkpoints = checkpoints;
            
        }
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing method called")
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("TextField should snd editing method called")
        return true;
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("While entering the characters this method gets called")
        return true;
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        return true;
    }

    
    
}
