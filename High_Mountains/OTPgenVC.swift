//
//  OTPgenVC.swift
//  High_Mountains
//
//  Created by Abhishek on 30/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class OTPgenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    

   

}


