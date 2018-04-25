//
//  ProfileTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 04/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ProfileTVC: UITableViewCell {

    @IBOutlet weak var lblbPhotoTItle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    
    @IBOutlet weak var lblLikeCount: UILabel!
    @IBOutlet weak var lblShareCount: UILabel!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    var tid : String = ""
    
    var parent : UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = self.img.frame.size.width/2
        img.clipsToBounds = true
        
        self.btnLike.addTarget(self, action: #selector(ProfileTVC.btnLikeAction(_:)) , for: .touchUpInside)
        self.btnComment.addTarget(self, action: #selector(ProfileTVC.btnCommentAction(_:)) , for: .touchUpInside)
    }
    
    var obj : Any!
    
    func populate(_ data : TimelineModel) {
        
        obj = data
        tid = data.timeline_id!
        lblTitle.text = "Swapnil"
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
        lblDate.text = data.time
        lblLikeCount.text = "\(data.friend_like ?? "") \(data.like_count!) others likes"
        lblShareCount.text = "\(data.share_count!) Share"
        lblbPhotoTItle.text = data.caption?.capitalized
        if data.isliked! == "true" {
            btnLike.isSelected = true
        }
        else {
            btnLike.isSelected = false
        }
    }
    
    func populate(_ data : PhotoModel) {

        obj = data
        tid = data.timeline_id!
        lblTitle.text = "Swapnil"
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image_url!)")
        lblDate.text = data.time
        lblLikeCount.text = "\(data.like_count!) Like"
        //lblCommentCount.text = "\(data.comment_count!) Comment"
        lblShareCount.text = "\(data.share_count!) Share"
        lblbPhotoTItle.text = data.caption?.capitalized
        /*if data.isliked! == "true" {
            btnLike.isSelected = true
        }
        else {
            btnLike.isSelected = false
        }*/
    }

    @IBAction func btnLikeAction(_ sender: Any) {
        likeData(tid)
    }
    
    @IBAction func btnCommentAction(_ sender: Any) {
        let controller : CommentVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "Comment") as! CommentVC
        controller.tId = tid
        self.parent.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnShareAction(_ sender: Any) {
    }
    
    func likeData(_ tid : String) {
        let postparam="action=like_data&&uid=\(userId)&&timeline_id=\(tid)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : AnyObject = dt.object as AnyObject
                    self.lblLikeCount.text = "\(res["like Count"]!! as! String) Like"
                    if (res["msg"]!! as! String).contains("increase") {
                        self.btnLike.isSelected = true
                    }
                    else {
                        self.btnLike.isSelected = false
                    }
                }
                
            }
            else {
                //self.alertDialog(msg: result as! String)
            }
        })
    }
    
    @IBAction func MoreIcon(_ sender: UIButton) {
        var alert = UIAlertController(title: "dddddd", message: "aaaa", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
      
       
    }
    
    
    class func instanceFromNib() -> ProfileTVC {
        return UINib(nibName: "ProfileTVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProfileTVC
    }
}
