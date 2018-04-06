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

     //sidemenu()
        
        //let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.red]
        //navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        slidingMenus()
    }
    @IBAction func btnProfileAction(_ sender: Any) {
        let vc : profileVC = STORY_BOARD.instantiateViewController(withIdentifier: "profileVC") as! profileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openLeftMenu() {
        
    }

    func openRightMenu() {
        
    }
    
    func slidingMenus()
    {
        menubar.target = self
        menubar.action = #selector(SlideMenuController.openLeft)
        
        
        
//        profile.target = self
//        profile.action=#selector(SlideMenuController.openRight)
    }

    

    func sidemenu()
    {
        if revealViewController() != nil{
            
            menubar.target = revealViewController()
            menubar.action = #selector(SWRevealViewController.revealToggle(_:))
            
            
            
//            profile.target=revealViewController()
//            profile.action=#selector(SWRevealViewController.rightRevealToggle(_:))

            revealViewController().rearViewRevealWidth=400
            revealViewController().rightViewRevealWidth=300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }

}
}
