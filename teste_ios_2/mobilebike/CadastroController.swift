//
//  CadastroController.swift
//  mobilebike
//
//  Created by Anderson Soares on 09/06/16.
//  Copyright © 2016 Anderson Soares. All rights reserved.
//

import UIKit

class CadastroController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var scroolView: UIScrollView!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var estado: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmasenha: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var rua: UITextField!
    @IBOutlet weak var complemento: UITextField!
    @IBOutlet weak var cidade: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var progress: UIActivityIndicatorView!
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
    @IBAction func voltar(sender: AnyObject) {
         dismissViewControllerAnimated(true,completion:nil);
    }
    @IBAction func cadastro(sender: UIButton) {
       // progress.startAnimating()
        let requestUrl =  NSURL(string: Endpont + "api/company")!
        let request = NSMutableURLRequest(URL:requestUrl)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type" )
        request.addValue("application/json", forHTTPHeaderField: "Accept" )
        request.addValue("UTF-8",forHTTPHeaderField: "charset" )
        
        
        let data:NSMutableDictionary = NSMutableDictionary()
        data.setValue(email.text!, forKey: "email")
        data.setValue(senha.text!, forKey: "password")
        data.setValue(estado.text!, forKey: "addressState")
        data.setValue(telefone.text!, forKey: "phoneNumber")
        data.setValue(rua.text!, forKey: "addressStreet")
        data.setValue(cidade.text!, forKey: "addressCity")
        data.setValue(complemento.text!, forKey: "addressComplement")
        data.setValue("0", forKey: "addressNumber")
        data.setValue(cpf.text!, forKey: "ownerCPF")
        data.setValue(nome.text!, forKey: "fullname")
        
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
                var msg = json?["message"] as? String;
                print(msg)
                if(msg == nil){
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
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
        scroolView.setContentOffset(CGPointMake(0,250), animated: true)
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

