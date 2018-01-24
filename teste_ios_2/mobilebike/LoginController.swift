//
//  LoginController.swift
//  mobilebike
//
//  Created by Anderson Soares on 09/06/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//


import UIKit

class LoginController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var progress: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.stopAnimating()
        progress.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        //self.navigationController?.navigationBarHidden = false
        return super.shouldPerformSegueWithIdentifier(identifier, sender: sender)
    }
    
    override func viewDidAppear(animated: Bool) {
      //  self.navigationController?.navigationBarHidden = true;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //desaparecer com navegation
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(animated: Bool) {
        //aparecer a navegation
       // self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    
   
    
    @IBAction func login(sender: UIButton) {
        progress.startAnimating()
        let requestUrl =  NSURL(string: Endpont + "api/token")!
        let request = NSMutableURLRequest(URL:requestUrl)
        request.HTTPMethod = "POST"
        request.addValue("application/x-www-form-urlencoded; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        //request.addValue("Accept", forHTTPHeaderField: "application/json")
        //request.addValue("charset", forHTTPHeaderField: "UTF-8")
        let postString = "grant_type=password&client_secret=\(senha.text!)&client_id=\(email.text!)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);// postString.dataUsingEncoding(NSUTF8StringEncoding)
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
                let tokentype = json?["token_type"] as? String;
                let accesstoken = json?["token"] as? String;
                if(accesstoken != nil){
                    print(tokentype)
                    print(accesstoken)
                    //let token = "\(tokentype) \(accesstoken)";
                    NSUserDefaults.standardUserDefaults().setBool(true,forKey:  "logado")
                    NSUserDefaults.standardUserDefaults().setValue(accesstoken,forKey: "token")
                    dispatch_async(dispatch_get_main_queue()) {
                  //     self.performSegueWithIdentifier("logintomain", sender: self)
                          self.dismissViewControllerAnimated(false, completion: nil)
                    }
                }else{
                    var msg = json?["error_description"] as? String;
                    print(msg)
                    if(msg == nil){
                        msg = "Ocorreu um erro."
                    }
                    dispatch_async(dispatch_get_main_queue()) {
                        let alertController = UIAlertController(title: "Erro", message:
                            msg, preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.Default,handler: nil))
                        //self.presentViewController(alertController, animated: true, completion: nil)
                        self.dismissViewControllerAnimated(true,completion:nil);
                    }
                }
            }else{
                var msg = json?["error_description"] as? String;
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
    /*
    @IBAction func get(sender: UIButton) {
    let requestURL: NSURL = NSURL(string: "http://www.learnswiftonline.com/Samples/subway.json")!
    let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
    let session = NSURLSession.sharedSession()
    let task = session.dataTaskWithRequest(urlRequest) {
    (data, response, error) -> Void in
    
    let httpResponse = response as! NSHTTPURLResponse
    let statusCode = httpResponse.statusCode
    
    if (statusCode == 200) {
    print("Everyone is fine, file downloaded successfully.")
    do{
    
    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
    
    if let stations = json["stations"] as? [[String: AnyObject]] {
    
    for station in stations {
    
    if let name = station["stationName"] as? String {
    
    if let year = station["buildYear"] as? String {
    print(name,year)
    }
    
    }
    }
    
    }
    
    }catch {
    print("Error with Json: \(error)")
    }
    }
    }
    
    task.resume()
    
    }
    
    @IBAction func post(sender: UIButton) {
    let requestUrl =  NSURL(string: "http://app.amovitrine.com.br/safe/loginmobile.php")!
    let request = NSMutableURLRequest(URL:requestUrl)
    request.HTTPMethod = "POST"
    request.addValue("Content-Type", forHTTPHeaderField: "application/x-www-form-urlencoded;charset=UTF-8")
    let postString = "email=anderson@devmaker.com.br&password=123"
    request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request)
    { data, response,
    error in guard error == nil && data != nil
    else {                                                          // check for fundamental networking error
    print("error=\(error)")
    return
    }
    
    if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
    print("statusCode should be 200, but is \(httpStatus.statusCode)")
    print("response = \(response)")
    }
    
    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
    print("responseString = \(responseString)")
    }
    task.resume()
    }*/
    
    
}
