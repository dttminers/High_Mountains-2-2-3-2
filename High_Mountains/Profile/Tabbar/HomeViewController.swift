//
//  HomeViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 07/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate{
    
    @IBOutlet weak var tableviewHome: UITableView!
    @IBOutlet weak var menubar: UIBarButtonItem!
    @IBOutlet weak var profile: UIBarButtonItem!
    
    
    
    var Home : [TimelineModel] = []
    var photoRes : [PhotoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        //        //sidemenu()
        
        //let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.red]
        //navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        //slidingMenus()
        tableviewHome.register(UINib(nibName : "PostsTextTVC", bundle:nil), forCellReuseIdentifier: "PostsTextTVC")
        tableviewHome.register(UINib(nibName : "ProfileTVC", bundle:nil), forCellReuseIdentifier: "ProfileTVC")
        self.URLDownload()
        
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let desVC : HomeClcklargVC = STORY_BOARD.instantiateViewController(withIdentifier: "HomeClcklargVC") as! HomeClcklargVC
//        desVC.feedimg.image = photoRes[indexPath.row]as! UIImage
//        self.navigationController?.pushViewController(desVC, animated: true)
//    }
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
    
    func URLDownload()
    {
        let postparam = "action=fetch_timeline&&uid=\(userId)";
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc: HomeClcklargVC  = STORY_BOARD.instantiateViewController(withIdentifier: "HomeClcklargVC") as! HomeClcklargVC
        vc.obj = photoRes[indexPath.row]
        self.show(vc, sender: nil)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       if (Home[indexPath.row].activity == "photo"){
            let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
            cell.populate(Home[indexPath.row])
            cell.delegate = self


            return cell
        }
        
        else if (Home[indexPath.row].activity == "album"){
            let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
            cell.populate(Home[indexPath.row])
            cell.delegate = self
            return cell
        }
        else {
           let cell : PostsTextTVC = tableView.dequeueReusableCell(withIdentifier: "PostsTextTVC", for: indexPath) as! PostsTextTVC
           cell.populateData(Home[indexPath.row])
     // let cell  = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath)
        
                 return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension//313
    }

}

extension HomeViewController : slideMenuDelegate {
    func open() {
        self.slideMenuController()?.openLeft()
        
    }
    
}

extension HomeViewController: MoreItem{
    
    
    
    
    func didButtonPressed() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let camera = UIAlertAction(title: "Share", style: UIAlertActionStyle.default, handler: {ACTION in
            
            let activityVC = UIActivityViewController(activityItems:["www.google.com"], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC,animated: true,completion: nil)
            
        })
        
        let Photolib = UIAlertAction(title: "Delete", style: UIAlertActionStyle.default, handler: {ACTION in
            
            let imagePicker = UIImagePickerController()
           // imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(camera)
        alert.addAction(Photolib)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
