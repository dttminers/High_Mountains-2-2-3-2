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
        if(obj.profile_pic?.contains("uploads"))!{
        img.loadImageUsingCache(withUrl:"\(url)\(obj.profile_pic!)")
        }else{
              img.loadImageUsingCache(withUrl: obj.profile_pic!)
        }
        lblName.text = obj.name?.capitalized
        lblCommonFriend.text = "\(obj.mutual_friend_count ?? 0) Common Friends"
      
    }
   
    @IBAction func Confirm(_ sender: UIButton) {
       
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let postparam = "action=follow_accept_data&&friend_id=\(obj.uid ?? 0)&&uid=\(userId)";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)follow_data.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    if let name = res["status"]as? Int as Optional!{
                        print(name!)
                        if (name == 1)
                        {
                            print("confirm")
                            
                        }
                    }
                    
                    
                }
                else {
                    print("fsil")
                }
                
            })
            
        }else {
            print("There is no internet connection")
        }
       
}
}
