//
//  CommentTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 12/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class CommentTVC: UITableViewCell {

    @IBOutlet weak var Comment_img: UIImageView!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblmsgComment: UILabel!
    @IBOutlet weak var lblCommentRply: UILabel!
    @IBOutlet weak var lblCommentLike: UILabel!
    @IBOutlet weak var CommentDate: UILabel!
    
    @IBOutlet weak var btnLikes: UIButton!
    
    var tid : String = ""
    var obj : SendComment!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.btnLikes.addTarget(self, action: #selector(CommentTVC.btnlike(_:)) , for: .touchUpInside)
        
    }

    @IBAction func btnlike(_ sender: Any) {
        likeData(tid)
    }
    
    
    func populateData(_ data : SendComment) {
        obj = data
        tid = data.timeline_id!
        AppUtility.setCornerRadius(Comment_img, radius: 25)
        if (data.profile_pic?.contains("uploads"))!{
        Comment_img.loadImageUsingCache(withUrl:"\(url)\(data.profile_pic!)")
        }else {
            self.Comment_img.loadImageUsingCache(withUrl:"\(data.profile_pic!)")
        }
        lblComment.text = data.username?.capitalized
        lblmsgComment.text = data.comment
        lblCommentRply.text = "\(data.reply_count ?? "0")Reply"
        lblCommentLike.text = "\(data.like_count ?? "0")"
    
}
    
    func populate(_ data : TimelineModel) {
      
        if data.isliked! == "true" {
            btnLikes.isSelected = true
        }
        else {
           btnLikes.isSelected = false
        }
    }
    
    func likeData(_ tid : String) {
        let postparam="action=like_data&&uid=\(userId)&&timeline_id=\(tid)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : AnyObject = dt.object as AnyObject
                    self.lblCommentLike.text = "\(res["like Count"]!! as! String)"
                    if (res["msg"]!! as! String).contains("increase") {
                        self.btnLikes.isSelected = true
                    }
                    else {
                        self.btnLikes.isSelected = false
                    }
                }
                
            }
            else {
                //self.alertDialog(msg: result as! String)
            }
        })
}
}
