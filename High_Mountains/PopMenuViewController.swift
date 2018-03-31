//
//  PopMenuViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 23/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PopMenuViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Gender.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return Gender[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.Dropdownlisttxt.text = self.Gender[row]
        self.pickvList.isHidden = true
        
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
    
    if textField == self.Dropdownlisttxt {
    self.pickvList.isHidden = false
    textField.endEditing(true)
    }
    
    }
    @IBOutlet weak var Dropdownlisttxt: UITextField!
    
    @IBOutlet weak var pickvList: UIPickerView!
    var Gender = ["Male","Female","Other"]
    //let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       //DropDownPicktxt.inputView = picker
        
        
        //pop background color
      //self.view.backgroundColor = UIColorwithAlphaComponent(0.8)
        self.showAnimate()
    }

    
    @IBAction func Cancelpopupbtn(_ sender: Any) {
        
        self.view.removeFromSuperview()
        
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });

   

}
}
