//
//  FollowTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 05/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FollowVC: UIViewController {
    
    @IBOutlet weak var tableFollow: UITableView!
    
    var followRes : [FollowModel] = []
    
    var ListType : String = "following"      //following  | follower
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableFollow.register(UINib(nibName : "FollowListTVC", bundle:nil), forCellReuseIdentifier: "FollowListTVC")
        self.URLDownload()
    }
    
    

    func URLDownload()
    {
        
        let postparam = "action=follow_\(ListType)_fetch&&uid=2";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)follow_data.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res)
                
                self.followRes = DATA_MANAGER.setFollowDictionary(res)
                self.tableFollow.reloadData()
            }
            else {
                self.alertDialog(msg: result as! String)
            }
            
        })
    }
    
    @objc func btnFollowAction(_ sender: UIButton) {
        var action = ""
        if ListType == "following" {
            action = "unfollow_data"
        }
        else {
            action = "follow_data"
        }
        let postparam = "action=\(action)&&uid=2&&friend_id=\(followRes[sender.tag].uid)"
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)\(action).php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : AnyObject = dt.object as AnyObject
                print(res)
                self.URLDownload()
            }
            else {
                self.alertDialog(msg: result as! String)
            }
            
        })
    }
}

extension FollowVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return followRes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FollowListTVC = tableView.dequeueReusableCell(withIdentifier: "FollowListTVC", for: indexPath) as! FollowListTVC
        cell.ListType = ListType
        cell.btnFollow.tag = indexPath.row
        cell.btnFollow.addTarget(self, action: #selector(btnFollowAction), for: UIControlEvents.touchUpInside)
        cell.populateData(followRes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

