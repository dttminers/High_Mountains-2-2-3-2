//
//  HomeVC.swift
//  High_Mountains
//
//  Created by Abhishek on 18/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
     var Home : [TimelineModel] = []

    @IBOutlet weak var tableview: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.register(UINib(nibName : "PostsTextTVC", bundle:nil), forCellReuseIdentifier: "PostsTextTVC")
         tableview.register(UINib(nibName : "ProfileTVC", bundle:nil), forCellReuseIdentifier: "ProfileTVC1")
        self.URLDownload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func URLDownload()
    {
        let postparam = "action=fetch_timeline&&uid=2";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res)
                
                self.Home = DATA_MANAGER.setTimelineDictionary(res)
                self.tableview.reloadData()
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
        if Home[indexPath.row].activity == "photo"{
        return UITableViewAutomaticDimension
        }else{
            return UITableViewAutomaticDimension
        }
    
}

}

