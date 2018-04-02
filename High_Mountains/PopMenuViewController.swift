//
//  PopMenuViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 23/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PopMenuViewController: UIViewController,UITextFieldDelegate  {
    @IBOutlet weak var GenderLbl: UILabel!
    
    @IBAction func GenderBtn(_ sender: Any) {
    
    let alret = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let Male = UIAlertAction(title: "Male", style: .default, handler: nil)
        let Female = UIAlertAction(title: "Female", style: .default, handler: {(ACTION) in self.GenderLbl.text = "Female"})
        let Others = UIAlertAction(title: "Other", style: .default, handler: nil)
    alret.addAction(Male)
    alret.addAction(Female)
    alret.addAction(Others)
        self.present(alret, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
    if textField == self.Dropdownlisttxt {

    textField.endEditing(true)
    }
    
    }
    @IBOutlet weak var Dropdownlisttxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
