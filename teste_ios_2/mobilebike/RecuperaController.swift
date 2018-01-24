//
//  RecuperaController.swift
//  mobilebike
//
//  Created by Anderson Soares on 09/06/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//

import UIKit

class RecuperaController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var email: UITextField!

    @IBOutlet weak var progress: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.stopAnimating()
        progress.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
        
        email.text = "luis.en.pato@gmail.com";
    }
    
    @IBAction func voltar(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true,completion:nil);
    }
    @IBAction func recuperar(sender: UIButton) {
        progress.startAnimating()
        let requestUrl =  NSURL(string: Endpont + "api/company/rememberpassword")!
        let request = NSMutableURLRequest(URL:requestUrl)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type" )
        request.addValue("application/json", forHTTPHeaderField: "Accept" )
        request.addValue("UTF-8",forHTTPHeaderField: "charset" )
        
        let data:NSMutableDictionary = NSMutableDictionary()
        data.setValue(email.text!, forKey: "email")
        
        do{
            let jsonData = try NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted);
            let json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
            request.HTTPBody = json?.dataUsingEncoding(NSUnicodeStringEncoding);
        }catch {
            print("Error with Json: \(error)")
        }
        
        //postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            (data, response, error) -> Void in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            var json:AnyObject?;
            do{
                let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("responseString = \(responseString)")
                json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
            }catch {
                print("Error with Json: \(error)")
            }
            
            if (statusCode >= 200 && statusCode < 300) {
                print("ok")
                var msg = json?["message"] as? String;
                print(msg)
                if(msg == nil){
                    dispatch_async(dispatch_get_main_queue()) {
                        let alertController = UIAlertController(title: "Sucesso", message:
                            "Senha recuperada com sucesso", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.Default,handler: nil))
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                    }
                }else{
                    dispatch_async(dispatch_get_main_queue()) {
                        let alertController = UIAlertController(title: "Erro", message:
                            msg, preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.Default,handler: nil))
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                }

                
            }else{
                var msg = json?["message"] as? String;
                print(msg)
                if(msg == nil){
                    msg = "Ocorreu um erro."
                }
                dispatch_async(dispatch_get_main_queue()) {
                    let alertController = UIAlertController(title: "Erro", message:
                        msg, preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.progress.stopAnimating()
            }
        }
        
        task.resume()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
