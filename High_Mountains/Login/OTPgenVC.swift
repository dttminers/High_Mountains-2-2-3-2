//
//  OTPgenVC.swift
//  High_Mountains
//
//  Created by Abhishek on 30/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class OTPgenVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var OtpTxt1: UITextField!
    @IBOutlet weak var OtpTxt2: UITextField!
    @IBOutlet weak var OtpTxt3: UITextField!
    @IBOutlet weak var Otptxt4: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        OtpTxt1.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        OtpTxt2.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        OtpTxt3.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        Otptxt4.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        OtpTxt1.becomeFirstResponder()
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        if text?.utf16.count == 1{
            switch textField {
                
            case OtpTxt1:
            OtpTxt2.becomeFirstResponder()
            case OtpTxt2:
                OtpTxt3.becomeFirstResponder()
            case OtpTxt3:
                Otptxt4.becomeFirstResponder()
            case Otptxt4:
                Otptxt4.resignFirstResponder()
            default:
                break
                
            
        }
        }

    }
    
    @IBAction func SubmtBtn(_ sender: Any) {
        
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let Controller = Storyboard.instantiateViewController(withIdentifier: "AlreadyMember")
        self.present(Controller, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //

   

}


