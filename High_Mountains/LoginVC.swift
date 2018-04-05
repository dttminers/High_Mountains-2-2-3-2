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
        
       if userData != nil {
            createMenuView()
        }
        
        UsernameTxt.delegate = self
        PasswordTxt.delegate = self
        
        // icon added
        let Usernameimg = UIImage(named: "username")
        image.addLeftImageTo(txtField: UsernameTxt, andImage: Usernameimg!)
        
        let passwordimg = UIImage(named: "pwd")
        image.addLeftImageTo(txtField: PasswordTxt, andImage: passwordimg!)
    }
    
    @IBAction func SingInbtn(_ sender: Any) {
        
        self.view.endEditing(true)
        //TextFieldDelegate
        //self.UsernameTxt.resignFirstResponder()
        //self.PasswordTxt.resignFirstResponder()
        
        //validation method
        let UserName = UsernameTxt.text!
        let Password = PasswordTxt.text!
        //let alert = true
        
        
        if (UserName.isEmpty || Password.isEmpty){
            
            self.alertDialog(header: "Alert", msg: "Field can't be Empty")
            
        }
        else if (!UserNamelbl.text!.isEmpty || !Passwordlbl.text!.isEmpty) {
            
        }
        else if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let postparam = "username=\(UsernameTxt.text!) &&password=\(PasswordTxt.text!) &&action=login";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    if let name = res["status"]as? Int as Optional!{
                        print(name!)
                        if (name == 1)
                        {
                            userData = res as! [String : String]
                            defaults.set(userData, forKey: ud_key_userData)
                            defaults.synchronize()
                            createMenuView()
                            //StoryBoard
                            /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let controller = storyboard.instantiateViewController(withIdentifier: "Menu")
                            self.present(controller, animated: true, completion: nil)*/
                            
                        }
                        else if(name == 0){
                            let res = dt.object as AnyObject
                            if (res["msg"]as? String) != nil{
                                
                                self.alertDialog(header: "Alert", msg: "Failed")
                                print("failed")
                            }
                        }
                        
                    }
                    
                    
                    //                    let dte = String(data: result as! Data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
                    //                    print(dte!)
                    
                    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == UsernameTxt {
            PasswordTxt.becomeFirstResponder()
        }
        else {
            SingInbtn(self)
        }
        return true
    }
}






