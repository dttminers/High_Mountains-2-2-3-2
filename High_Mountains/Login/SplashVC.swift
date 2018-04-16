//
//  SplashVC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 16/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let data = defaults.object(forKey: ud_key_userData) as? NSDictionary {
            print(data)
            Timer.scheduledTimer(timeInterval: TimeInterval(3), target: self, selector: #selector(SplashVC.enterApp), userInfo: nil, repeats: false)
        }
        else {
            Timer.scheduledTimer(timeInterval: TimeInterval(3), target: self, selector: #selector(SplashVC.goToLogin), userInfo: nil, repeats: false)
            
        }
    }

    @objc func goToLogin()
    {
        self.performSegue(withIdentifier: "proceedToLogin", sender: self)
    }
    
    @objc func enterApp() {
        createMenuView()
    }
}
