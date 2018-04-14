//
//  FollowingRequestsTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 06/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FollowingRequestsTVC: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCommonFriend: UILabel!
    
    
     var obj : FetchRequest!
    
    func populateData(_ data : FetchRequest){
        obj = data
        AppUtility.setCornerRadius(img, radius: 20)
        img.loadImageUsingCache(withUrl: data.profile_pic!)
        lblName.text = data.name
        lblCommonFriend.text = "\(String(describing: data.mutual_friend_count)) Common Friends"
        
    }
   
    @IBAction func Confirm(_ sender: Any) {
        
    }
}

