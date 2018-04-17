//
//  HomeViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 07/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet weak var menubar: UIBarButtonItem!
    @IBOutlet weak var profile: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//         tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
//
//        //sidemenu()
//        setupTabBar()
        //let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.red]
        //navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //slidingMenus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureNavView(self, isBack: false)
        //navigationController?.navigationBar.showView((self.navigationController?.navigationBar)!, navigationItem: navigationItem, navigationController: self.navigationController!, isBack: false)
        
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
//    func setupTabBar() {
//
//        let videoController = createNavController(vc: FetchRequestVC(), selected: #imageLiteral(resourceName: "ic_mybucketlist"), unselected: #imageLiteral(resourceName: "location_red"))
//        let favoriteController = createNavController(vc: CommentVC(), selected: #imageLiteral(resourceName: "ic_mybucketlist"), unselected: #imageLiteral(resourceName: "location_red"))
//        let favoriteController1 = createNavController(vc: CommentVC(), selected: #imageLiteral(resourceName: "ic_mybucketlist"), unselected: #imageLiteral(resourceName: "location_red"))
//        let favoriteController2 = createNavController(vc: CommentVC(), selected: #imageLiteral(resourceName: "ic_mybucketlist"), unselected: #imageLiteral(resourceName: "location_red"))
//        viewControllers = [videoController,favoriteController,favoriteController1,favoriteController2]
//
//        guard let items = tabBar.items else { return }
//
//        for item in items {
//            item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
//        }
//    }


}

extension HomeViewController : slideMenuDelegate {
    func open() {
        self.slideMenuController()?.openLeft()
        
    }
}
//extension UITabBarController {
//
//    func createNavController(vc: UIViewController, selected: UIImage, unselected: UIImage) -> UINavigationController {
//        let viewController = vc
//        let navController = UINavigationController(rootViewController: viewController)
//        navController.tabBarItem.image = unselected
//        navController.tabBarItem.selectedImage = selected
//        return navController
//    }
//}

