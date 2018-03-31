//
//  customtoolbar.swift
//  High_Mountains
//
//  Created by Abhishek on 07/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation
import  UIKit

class customtoolbar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let home = UIViewController()
         let navigationController = UINavigationController(rootViewController: home)
      //  navigationController.title = ""
        navigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        let person = UIViewController()
        let pnavigationController = UINavigationController(rootViewController: person)
        //  navigationController.title = ""
        pnavigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        let plus = UIViewController()
        let plnavigationController = UINavigationController(rootViewController: plus)
        //  navigationController.title = ""
        plnavigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        
        let bell = UIViewController()
        let bnavigationController = UINavigationController(rootViewController: bell)
        //  navigationController.title = ""
        bnavigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        let chat = UIViewController()
        let cnavigationController = UINavigationController(rootViewController: chat)
        //  navigationController.title = ""
        cnavigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        viewControllers = [navigationController,pnavigationController,plnavigationController,bnavigationController,cnavigationController]
        tabBar.isTranslucent = false
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.returnRGBColor(r: 242 , g: 242, b: 242, alpha: 1).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
}
}
