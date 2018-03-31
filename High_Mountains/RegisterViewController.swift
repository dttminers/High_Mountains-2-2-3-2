//
//  RegisterViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 05/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    
    //Textfield
    @IBOutlet weak var UserFullNametxt: HoshiTextField!
    @IBOutlet weak var UserNametxt: HoshiTextField!
    @IBOutlet weak var Emailtxt: HoshiTextField!
    @IBOutlet weak var Passwordtxt: HoshiTextField!
    @IBOutlet weak var MobileNotxt: HoshiTextField!
    @IBOutlet weak var Dobtxt: HoshiTextField!
    @IBOutlet weak var ReferenceCodetxt: HoshiTextField!
    
    //Errorlabel
    @IBOutlet weak var UserFullNamelbl: UILabel!
    @IBOutlet weak var UserNamelbl: UILabel!
    @IBOutlet weak var EmailLbl: UILabel!
    @IBOutlet weak var Passwordlbl: UILabel!
    @IBOutlet weak var MobileNolbl: UILabel!
    @IBOutlet weak var Doblbl: UILabel!
    @IBOutlet weak var ReferenceCodelbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      UserFullNametxt.delegate = self
      UserNametxt.delegate = self
      Emailtxt.delegate = self
      Passwordtxt.delegate = self
      MobileNotxt.delegate = self
      Dobtxt.delegate = self
      ReferenceCodetxt.delegate = self
        
         self.UserFullNametxt.resignFirstResponder()
         self.Passwordtxt.resignFirstResponder()
         self.UserNametxt.resignFirstResponder()
         self.Emailtxt.resignFirstResponder()
         self.MobileNotxt.resignFirstResponder()
         self.Dobtxt.resignFirstResponder()
        self.ReferenceCodetxt.resignFirstResponder()
        
        
        // textfield icon
       let Usernameimg = UIImage(named:"pass1")
        addLeftImageTo(txtField: UserNametxt, andImage: Usernameimg!)
        
       /* let passwordImage = UIImage(named:"pass1")
        addLeftImageTo(txtField: Password, andImage: passwordImage!)*/
//img.size.width
       // img.size.height
    }

    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 2.0, width: 16, height: 15))
        
        
        leftImageView.image = img
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        view.addSubview(leftImageView)
        txtField.leftView = view
        txtField.leftViewMode = .always
        
        //Nsuser deafaults
        
       // let Jdata : Any? = UserDefaults.standard.object(forKey: "uid")
       // print(Jdata)
        
    }
    
    
    // hiddin for keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    
    //function for emailvalidation
    func invalid(emailid:String) -> Bool {
        
        let exp="[A-Za-z0-9_%-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", exp).evaluate(with:emailid)
    }
    
    
    @IBAction func generateotp(_ sender: Any) {
        
        //Validatio by ALert
        let FullName=UserFullNametxt.text
        let UserName=UserNametxt.text
        let Password=Passwordtxt.text
        let emailid=Emailtxt.text?.lowercased()
        let finalemail=emailid?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let MobileNo=MobileNotxt.text
        let DOB=Dobtxt.text
        let ReferalCode=ReferenceCodetxt.text
        
        
        
        if((FullName?.isEmpty)!||(UserName?.isEmpty)!||(Password?.isEmpty)!||(finalemail?.isEmpty)!||(MobileNo?.isEmpty)!||(DOB?.isEmpty)!||(ReferalCode?.isEmpty)!)
        {
            let myalert=UIAlertController(title:"Alert", message: "Field Can't Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction=UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:nil)
            myalert.addAction(okAction)
            self.present(myalert, animated: true, completion:nil)
            return
        }
            
            
            
        else if(invalid(emailid:finalemail!))
        {
            print("valid")
            let myalert=UIAlertController(title:"Alert", message: "valid", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction=UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:nil)
            myalert.addAction(okAction)
            self.present(myalert, animated: true, completion:nil)
            return
            
        }
        else{
            print("ntvalid")
            let myalert=UIAlertController(title:"Alert", message: "NOT valid", preferredStyle: UIAlertControllerStyle.alert)
            
            let okAction=UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler:nil)
            myalert.addAction(okAction)
            self.present(myalert, animated: true, completion:nil)
            return
            
        }
    
    
        //navigation
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Otp")
        self.present(controller, animated: true, completion: nil)
        
        
        
        //Json
         if(currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN){
            
            let postparam = "fullname=swapnl1&&username=humangosau1r1&&email=humangosar1@.com&&password=122116&&contact_no=109&&dob=06/5/15&&referral_code=referencecode &&gender=male&&action=register";
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
    
    
    @IBAction func SignInHerebtn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SingUp")
        self.present(controller, animated: true, completion: nil)
        
    }
    
}



//validatiion
extension RegisterViewController: UITextFieldDelegate {
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == UserNametxt {
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
            
        else if textField == UserFullNametxt {
            
            if ((textField.text?.count)! < 3 ) {
                UserFullNamelbl.text = "Min 3 letter"
            }
            else if  ((textField.text?.count)!>20) {
                UserFullNamelbl.text = "Max 20 letter"
            }
            else{
                UserFullNamelbl.text = ""
            }
        }
            
        else if textField == Passwordtxt {
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
        
      /*  else if textField == Emailtxt {
            
            EmailLbl.text = "[A-Za-z0-9_%-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,6}"
            NSPredicate(format: "SELF MATCHES %@",EmailLbl).evaluate(with: EmailLbl)
            }*/
            
        else if textField == MobileNotxt{
            
            if ((textField.text?.count)! > 10 ) {
                MobileNolbl.text = "Max 10 letter"
            }
            else{
                MobileNolbl.text = ""
            }
            
        }
        
        else if textField == Dobtxt {
            if (textField.text?.count)! < 8 {
               Doblbl.text = "Min 8 letter"
            }
            else if (textField.text?.count)! > 20 {
               Doblbl.text = "Max 20 letter"
            }
            else {
                Doblbl.text = ""
            }
            
        }
            else if textField == ReferenceCodetxt {
                if (textField.text?.count)! < 8 {
                    ReferenceCodelbl.text = "Min 8 letter"
                }
                else if (textField.text?.count)! > 20 {
                    ReferenceCodelbl.text = "Max 20 letter"
                }
                else {
                    ReferenceCodelbl.text = ""
                }
        }
    }
}


