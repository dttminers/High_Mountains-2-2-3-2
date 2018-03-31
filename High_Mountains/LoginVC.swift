//
//  ViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 05/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //textfield
    @IBOutlet weak var UsernameTxt: HoshiTextField!
    @IBOutlet weak var PasswordTxt: HoshiTextField!
    
    //error label
    @IBOutlet weak var UserNamelbl: UILabel!
    @IBOutlet weak var Passwordlbl: UILabel!
     let overcastBlueColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        UsernameTxt.delegate = self
        PasswordTxt.delegate = self
    }
    
    @IBAction func SingInbtn(_ sender: Any) {
        
        //StoryBoard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Menu") 
        self.present(controller, animated: true, completion: nil)
        
        //TextFieldDelegate
        self.UsernameTxt.resignFirstResponder()
        self.PasswordTxt.resignFirstResponder()
        
        //Json fatch
        if (currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN){
            
            let postparam = "username=swapnil &&password=swap1234 &&action=login";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let dte = String(data: result as! Data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                    print(dte!)
                }
                else {
                    self.alertDialog(msg: result as! String)
                }
                
            })
            
        }else {
            print("There is no internet connection")
        }
    }
    
    
    
    @IBAction func Register(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Register")
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func ForgetPasswordbtn(_ sender: Any) {
        
        
    }
    
    
    
    // hiddin for keyboard
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
}

//validatiion
extension LoginVC : UITextFieldDelegate {
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == UsernameTxt {
            if ((textField.text?.count)! < 3 ) {
                UserNamelbl.text = "Min 3 letter"
            }
            else if  ((textField.text?.count)!>20) {
                UserNamelbl.text = "Max 20 letter"
            }
            else{
                 UserNamelbl.text = ""
            }
        }
        else if textField == PasswordTxt {
            if (textField.text?.count)! < 8 {
                Passwordlbl.text = "Min 8 letter"
            }
            else if (textField.text?.count)! > 20 {
                Passwordlbl.text = "Max 20 letter"
            }
            else {
                Passwordlbl.text = ""
            }
        }
    }
}






