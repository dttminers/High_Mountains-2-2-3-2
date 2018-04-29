//
//  MainTabTBC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 25/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class MainTabTBC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        
        // Do any additional setup after loading the view.
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostsVC {
            if let newVC = tabBarController.storyboard?.instantiateViewController(withIdentifier: "Posts") {
                tabBarController.present(newVC, animated: true)
                return false
            }
        }
        return true
    }

}
