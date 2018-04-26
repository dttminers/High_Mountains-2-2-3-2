//
//  DisplayLikeVC.swift
//  High_Mountains
//
//  Created by Abhishek on 20/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class DisplayLikeVC: UIViewController {

    @IBOutlet weak var tableDisplayLike: UITableView!
    
    var LikeDisplay : [LikeDisplay] = []
    var ListType1 : String = ""
    var tId : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        tableDisplayLike.register(UINib(nibName : "FollowListTVC", bundle:nil), forCellReuseIdentifier: "FollowListTVC1")
        self.URLDownload()
    }

    func URLDownload()
    {
        let postparam = "action=display_like_details&&timeline_id=\(tId)&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)display_like_details.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res)
                
                self.LikeDisplay = DATA_MANAGER.sendLikeDisplayDictionary(res)
                self.tableDisplayLike.reloadData()
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }

    

  @objc func btnLikeDisplay(_ sender: UIButton) {
    var action = ""
    if ListType1 == "following" {
        action = "unfollow"
    }
    else {
        action = "follow_data"
    }
    let postparam = "action=\(action)&&uid=2&&friend_id=\(LikeDisplay[sender.tag].uid)"
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
extension DisplayLikeVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LikeDisplay.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FollowListTVC = tableView.dequeueReusableCell(withIdentifier: "FollowListTVC1", for: indexPath) as! FollowListTVC
        cell.ListType1 = ListType1
        cell.btnFollow.tag = indexPath.row
        cell.btnFollow.addTarget(self, action: #selector(btnLikeDisplay), for: UIControlEvents.touchUpInside)
        cell.populateDataLikesFetch(LikeDisplay[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50   
    }
}

