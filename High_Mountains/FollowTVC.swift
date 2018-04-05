//
//  FollowTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 05/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

struct Follw{

   let Followlbl: String!
   let FollowIMG: UIImage!
    let Count: Int!
}

class FollowTVC: UITableViewController {
    
   var People = [Follw]()

    override func viewDidLoad() {
        super.viewDidLoad()
     self.URLDownload()
        
       
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("FollowListTVC", owner: self, options: nil)?.first as! FollowListTVC
       cell.FollowNameLBL.text = "abhi"
        cell.FollowProfileIMG.image = UIImage(named: "download")
        return cell
    }
 
     override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 324
    }
    

    func URLDownload()
    {
        
        let postparam = "action=follow_follower_fetch&&uid=2";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)follow_data.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                let res : AnyObject = dt.object as AnyObject
                print(res)
                    
    
                
            }
            else {
                self.alertDialog(msg: result as! String)
            }
            
        })
        
    }
        
    }

