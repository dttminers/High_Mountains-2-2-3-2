//
//  Validationform.swift
//  High_Mountains
//
//  Created by Abhishek on 28/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation

/*extension ViewController: UITextFieldDelegate {
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case UsernameTxt:
            
            let (valid, message) = validate(textField)
            
            if valid {
                PasswordTxt.becomeFirstResponder()
            }
            
            // Update Password Validation Label
            self.UserNamelbl.text = message
            
            
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.UserNamelbl.isHidden = valid
            })
            
        default:
            
            let (valid, message) = validate(textField)
            
            if valid {
                 PasswordTxt.resignFirstResponder()
            }
            
            // Update Password Validation Label
            self.Passwordlbl.text = message
            
            
            
            // Show/Hide Password Validation Label
            UIView.animate(withDuration: 0.25, animations: {
                self.Passwordlbl.isHidden = valid
            })
        }
        return true
        
}
    

func validate(_ textField: UITextField) -> (Bool, String?) {
    guard let text = textField.text else {
        return (false, nil)
    }
    
    if textField == UsernameTxt {
        return (text.count >= 6, "Your password is too short.")
    }
    
    return (text.count > 0, "This field cannot be empty.")
}
}
*/


