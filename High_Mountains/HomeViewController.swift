//
//  HomeViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 07/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableviewHome: UITableView!
    @IBOutlet weak var menubar: UIBarButtonItem!
    @IBOutlet weak var profile: UIBarButtonItem!
    
    
     var Home : [TimelineModel] = []
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//         tabBar.barTintColor = UIColor(red: 38/255, green: 196/255, blue: 133/255, alpha: 1)
//
//        //sidemenu()
//        setupTabBar()
        //let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.red]
        //navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //slidingMenus()
        tableviewHome.register(UINib(nibName : "PostsTextTVC", bundle:nil), forCellReuseIdentifier: "PostsTextTVC")
        tableviewHome.register(UINib(nibName : "ProfileTVC", bundle:nil), forCellReuseIdentifier: "ProfileTVC1")
        self.URLDownload()
        
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

    func URLDownload()
    {
        let postparam = "action=fetch_timeline&&uid=2";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res)
                
                self.Home = DATA_MANAGER.setTimelineDictionary(res)
                self.tableviewHome.reloadData()
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Home.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if Home[indexPath.row].activity == "photo"{
            let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC1", for: indexPath) as! ProfileTVC
            cell.populate(Home[indexPath.row])
            return cell
        }
            
        else {
            let cell : PostsTextTVC = tableView.dequeueReusableCell(withIdentifier: "PostsTextTVC", for: indexPath) as! PostsTextTVC
            cell.populateData(Home[indexPath.row])
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 313
        
        
    }

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

