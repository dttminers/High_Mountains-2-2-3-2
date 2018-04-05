//
//  FollowListTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 05/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FollowListTVC: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblCommonFrnds: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnFollow: UIButton!
    
    var ListType : String!
    var obj : FollowModel!
    
    func populateData(_ data : FollowModel) {
        obj = data
        AppUtility.setCornerRadius(img, radius: 20)
        AppUtility.setShadow(btnFollow, opacity: 0, radius: 0)
        img.loadImageUsingCache(withUrl: data.profile_pic)
        lblName.text = data.name
        lblCommonFrnds.text = "\(data.mutual_friend_count) Common Friends"
        if ListType == "follower" {
            if Int(data.following)! == 1 {
                btnFollow.setTitle("Following", for: .normal)
            }
            else {
                if Int(data.requested)! == 1 {
                    btnFollow.setTitle("Requested", for: .normal)
                }
                else {
                    btnFollow.setTitle("Follow", for: .normal)
                }
            }
        }
        else {
            btnFollow.setTitle("UnFollow", for: .normal)
        }
    }
    
    @IBAction func btnFollowAction(_ sender: Any) {
        
        
    }
    
}



/*
 {
 "name": "Swapnil Jadhav",
 "uid": "1",
 "profile_pic": "uploads/1/profile_pics/_1677c79858b770eb8HMG1522302955941.jpg",
 "mutual friend count": "0",
 "Requested": "1"
 }
 
 {
 "name": "Swapnil Jadhav",
 "uid": "1",
 "profile_pic": "uploads/1/profile_pics/_1677c79858b770eb8HMG1522302955941.jpg",
 "mutual friend count": "0",
 "Requested": "1",
 "following": "1"
 }
 */
