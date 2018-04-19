//
//  CommentsendView.swift
//  High_Mountains
//
//  Created by Abhishek on 16/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class CommentsendView: UIView {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tet: UITextField!
    @IBOutlet weak var bbtn: UIButton!
    
      var timelineRes : [TimelineModel] = []
  @objc func Sendbutton(_ sender: Any) {
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let postparam = "action=comment_data&&uid=26&&timeline_id=\(timelineRes)&&comment=\(tet.text!)";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    print(res)
                    
                    
                    
                }
                else {
                   print("msg: result as! String")
                }
                
            })
            
        }else {
            print("There is no internet connection")
        }
        
    }
   
}
