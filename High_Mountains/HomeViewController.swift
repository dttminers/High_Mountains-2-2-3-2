//
//  HomeViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 07/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menubar: UIBarButtonItem!
    @IBOutlet weak var profile: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

     sidemenu()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func sidemenu()
    {
        if revealViewController() != nil{
            
            menubar.target = revealViewController()
            menubar.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth=600
            revealViewController().rearViewRevealWidth=300
            
            
            profile.target=revealViewController()
            profile.action=#selector(SWRevealViewController.rightRevealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }

}
}
