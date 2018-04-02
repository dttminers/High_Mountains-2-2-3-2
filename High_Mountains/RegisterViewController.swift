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
        let Fullnameimg = UIImage(named: "user")
        image.addLeftImageTo(txtField: UserFullNametxt, andImage: Fullnameimg!)
        
        let Usernameimg = UIImage(named: "user")
        image.addLeftImageTo(txtField: UserNametxt, andImage: Usernameimg!)

        let Emailimg = UIImage(named: "user")
        image.addLeftImageTo(txtField: Emailtxt, andImage: Emailimg!)
        
        let passwordimg = UIImage(named: "user")
        image.addLeftImageTo(txtField: Passwordtxt, andImage: passwordimg!)
        
        let MobileNoimg = UIImage(named: "user")
        image.addLeftImageTo(txtField: MobileNotxt, andImage: MobileNoimg!)
        
        let Dobimg = UIImage(named: "user")
        image.addLeftImageTo(txtField: Dobtxt, andImage:Dobimg!)
        
        let ReferralCodeimg = UIImage(named: "user")
        image.addLeftImageTo(txtField: ReferenceCodetxt, andImage: ReferralCodeimg!)
    }

    
        
        //Nsuser deafaults
        
       // let Jdata : Any? = UserDefaults.standard.object(forKey: "uid")
       // print(Jdata)
    
    
    
    // hiddin for keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
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
       // let ReferalCode=ReferenceCodetxt.text
        
        if((FullName?.isEmpty)!||(UserName?.isEmpty)!||(Password?.isEmpty)!||(finalemail?.isEmpty)!||(MobileNo?.isEmpty)!||(DOB?.isEmpty)!)
        {
           alertDialog(header: "Alert", msg: "Field can't be empty")
            
        }
            
        else if(!isValidEmail(testStr: finalemail!)){
            print("not svalid")
          alertDialog(header: "Alert", msg: "Email Id is Not Valid")
            
        } else if (isValidPhone(value: MobileNo!)){
            alertDialog(header: "Alert", msg: "Invalid Phone no")
            }
    
        //Json
         if (currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN){
            
            let postparam = "fullname=\(UserFullNametxt.text!)&&username=\(UserNametxt.text!)&&email=\(Emailtxt.text!)&&password=\(Passwordtxt.text!)&&contact_no=\(MobileNotxt.text!)&&dob=\(Dobtxt.text!)&&referral_code=\(ReferenceCodetxt.text!)&&gender=male &&action=register";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    if let status = res["status"] as? Int as Optional{
                        print(status)
                        
                        if(status == 1)
                        {
                            //navigation
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let controller = storyboard.instantiateViewController(withIdentifier: "Otp")
                            self.present(controller, animated: true, completion: nil)
                            
                        }
                        else if (status == 0){
                            
                           self.alertDialog(header: "Alert", msg: "Registeration fail")
                        }
                        else if ((res["username"]as?String) != UserName) {
    
                            print("alerady register")
                        }
                        
                        else if (((res["contact_no"]as? String)) !=  MobileNo){
                            print("alerady register")
                        }
                        else if ((res["email"]as?String) != finalemail){
                            print("alerady register")
                        }
                    }
                    
                    
                    
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
        
        else if textField == Emailtxt {
            
            if (textField.text?.count)! < 6 {
                EmailLbl.text = "Min 6 letter"
            }
            else if (textField.text?.count)! > 20 {
                EmailLbl.text = "Max 20 letter"
            }
            else {
                EmailLbl.text = ""
            }
        }
            
            
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


