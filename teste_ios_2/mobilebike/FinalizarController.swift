//
//  FinalizarController.swift
//  mobilebike
//
//  Created by DevMaker Mobile on 6/13/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//

import UIKit

class FinalizarController: UIViewController {
    @IBOutlet weak var progress: UIActivityIndicatorView!
    @IBOutlet weak var labelprice: UILabel!
    var price:Double=0;
    var checkpoints = [Checkpoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.stopAnimating()
        progress.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        getprice();
    }
    
    @IBAction func finalizar(sender: UIButton) {
        //finalizartomain
        progress.startAnimating()
        let requestUrl =  NSURL(string: Endpont + "api/race")!
        let request = NSMutableURLRequest(URL:requestUrl)
        request.HTTPMethod = "POST"
      
    
        request.addValue("application/json", forHTTPHeaderField: "Content-Type" )
        request.addValue("application/json", forHTTPHeaderField: "Accept" )
        request.addValue("UTF-8",forHTTPHeaderField: "charset" )
        
        
        let data:NSMutableDictionary = NSMutableDictionary()
        data.setValue("2", forKey: "CompanyId")
        data.setValue("FodDate", forKey: "ScheduleType")
        data.setValue("", forKey: "ScheduleDate")
        data.setValue("teste race", forKey: "Description")
        data.setValue(price, forKey: "Price")
 
        
        var check: [NSMutableDictionary] = [];
        for i in 0..<checkpoints.count-1 {
            let data:NSMutableDictionary = NSMutableDictionary()
            data.setValue(checkpoints[i].description, forKey: "Description")
            data.setValue("\(checkpoints[i].addressStreet) \(checkpoints[i].addressNumber)  \(checkpoints[i].addressCity)", forKey: "Address")
            check.append(data)
        }
        
        data.setValue(check, forKey: "Checkpoints")

        
        /*let data2:NSMutableDictionary = NSMutableDictionary()
        data2.setValue(nome.text!, forKey: "fullname")
        data.setValue(data2, forKey: "data2")
        
        var numbers: [NSMutableDictionary] = [];
        let data4:NSMutableDictionary = NSMutableDictionary()
        data4.setValue(nome.text!, forKey: "fullname")
        numbers.append(data4)
        
        let data5:NSMutableDictionary = NSMutableDictionary()
        data5.setValue(nome.text!, forKey: "fullname")
        numbers.append(data5)
        
        data.setValue(numbers, forKey: "array")
        
        let data3:NSMutableDictionary = NSMutableDictionary()
        data3.setValue(nome.text!, forKey: "fullname")
        data.setValue(data2, forKey: "data2")*/
        
        
        do{
            let jsonData = try NSJSONSerialization.dataWithJSONObject(data, options: NSJSONWritingOptions.PrettyPrinted);
            let json = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
            request.HTTPBody = json?.dataUsingEncoding(NSUnicodeStringEncoding);
            print("Json: \(json)")
        }catch {
            print("Error with Json: \(error)")
        }
        

        
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
                dispatch_async(dispatch_get_main_queue()) {
                    let alertController = UIAlertController(title: "Sucesso", message:
                        "Cadastro efetuado com sucesso", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Fechar", style: UIAlertActionStyle.Default,handler: {(alert: UIAlertAction!) in
                        // self.performSegueWithIdentifier("cadastrotologin", sender: self)
                             self.navigationController?.popToRootViewControllerAnimated(true)
                    }))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
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
        }
        task.resume()
    }
    
    func getprice(){
        progress.startAnimating()
        let requestUrl =  NSURL(string: Endpont + "api/raceprice/3000/2")!
        let request = NSMutableURLRequest(URL:requestUrl)
        request.HTTPMethod = "GET"
        //request.addValue("Content-Type", forHTTPHeaderField: "application/x-www-form-urlencoded; charset=UTF-8")
        //request.addValue("Accept", forHTTPHeaderField: "application/json")
        //request.addValue("charset", forHTTPHeaderField: "UTF-8")
        
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
                let sprice = json?["price"] as? Double;
                if(sprice != nil){
                    print(sprice)
                    let formatter = NSNumberFormatter()
                    formatter.numberStyle = .CurrencyStyle
                    formatter.locale = NSLocale(localeIdentifier: "pt_BR")
                    //let dprice = Double(sprice!)
                    self.price = sprice!
                    dispatch_async(dispatch_get_main_queue()) {
                        self.labelprice.text = formatter.stringFromNumber(sprice!)
                    }
                }else{
                    
                }
            }else{
                
            }
            dispatch_async(dispatch_get_main_queue()) {
                self.progress.stopAnimating()
            }
        }
        
        task.resume()

    }
}
