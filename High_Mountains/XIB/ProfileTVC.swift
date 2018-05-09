//
//  ProfileTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 04/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

protocol MoreItem {
    
    func didButtonPressed()
    
}
protocol Comment1 {
    
    func Commet(_ tid : String)
    
}
protocol share {
    
    func ShareT()
    
}

class ProfileTVC: UITableViewCell {
    
    @IBOutlet weak var lblCommentCount: UILabel!
    @IBOutlet weak var lblbPhotoTItle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    
    @IBOutlet weak var lblLikeCount: UILabel!
    //@IBOutlet weak var lblShareCount: UILabel!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    var tid : String = ""
    var parent : UIViewController!
    var delegate: MoreItem?
    var delegate1: Comment1?
    var delegate2: share?
    var obj : Any!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = self.img.frame.size.width/2
        img.clipsToBounds = true
        
        self.btnLike.addTarget(self, action: #selector(ProfileTVC.btnLikeAction(_:)) , for: .touchUpInside)
        self.btnComment.addTarget(self, action: #selector(ProfileTVC.btnCommentAction(_:)) , for: .touchUpInside)
        self.btnShare.addTarget(self, action: #selector(ProfileTVC.btnShareAction(_:)), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileTVC.LikeDisplay(_:)))
        lblLikeCount.addGestureRecognizer(tap)
        lblLikeCount.isUserInteractionEnabled = true
        
        self.btnLike.setImage(UIImage(named:"comment"), for: .selected)
        self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
        
        self.btnLike.setImage(UIImage(named:"share1"), for: .selected)
        self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
    }
    
    
    
    func populate(_ data : TimelineModel) {
        
        obj = data
        //img.loadImageUsingCache(withUrl: "\(img1)")
        tid = data.timeline_id!
        lblTitle.text = "Swapnil"
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
        lblDate.text = data.time
        lblLikeCount.text = "Liked by \(data.friend_like ?? "") and \(data.like_count!) others "
        // lblShareCount.text = "\(data.share_count!) Share"
        lblbPhotoTItle.text = data.caption?.capitalized
        lblCommentCount.text = "View all \(data.comment_count ?? "0") Comment"
        if data.isliked! == "true" {
            
            //  btnLike.isSelected = true
            //btnLike.setTitleColor(.blue, for: .normal)
            self.btnLike.setImage(UIImage(named:"like2"), for: .normal)
            self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
            btnLike.tintColor = UIColor.red
        }
        else {
            
            // btnLike.isSelected = false
            //btnLike.setTitleColor(.black, for: .normal)
            self.btnLike.setImage(UIImage(named:"like1"), for: .selected)
            self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
            btnLike.tintColor = UIColor.black
        }
    }
    
    func populate(_ data : PhotoModel) {
        
        obj = data
        // img.loadImageUsingCache(withUrl: "\(profile_img)")
        tid = data.timeline_id!
        lblTitle.text = "Swapnil"
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image_url!)")
        lblDate.text = data.time
        lblLikeCount.text = "\(data.like_count ?? "0") Likes"
        //lblCommentCount.text = "\(data.comment_count!) Comment"
        // lblShareCount.text = "\(data.share_count!) Share"
        lblbPhotoTItle.text = data.caption?.capitalized
        /* if data.isliked! == "true" {
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
        if parent == nil {
            delegate1?.Commet(tid)
        }else{
            let controller : CommentVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "Comment") as! CommentVC
            controller.tId = tid
            self.parent.navigationController?.pushViewController(controller, animated: true)
        }
        
    } 
    
    @IBAction func btnShareAction(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems:["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self
        //self.parent(activityVC,animated: true,completion: nil)
        //delegate?.didButtonPressed()
        delegate2?.ShareT()
    }
    
    func likeData(_ tid : String) {
        let postparam="action=like_data&&uid=\(userId)&&timeline_id=\(tid)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : AnyObject = dt.object as AnyObject
                    self.lblLikeCount.text = "\(res["like Count"]!! as! String) Likes"
                    if (res["msg"]!! as! String).contains("increase") {
                        // self.btnLike.isSelected = true
                        //  self.btnLike.setTitleColor(.blue, for: .normal)
                        self.btnLike.setImage(UIImage(named:"like2"), for: .normal)
                        self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
                        //self.btnLike.tintColor = UIColor.blue
                        
                    }
                    else {
                        //self.btnLike.isSelected = false
                        //self.btnLike.setTitleColor(.black, for: .normal)
                        self.btnLike.setImage(UIImage(named:"like1"), for: .normal)
                        self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
                        // self.btnLike.tintColor = UIColor.black
                        
                    }
                }
                
            }
            else {
                //self.alertDialog(msg: result as! String)
            }
        })
    }
    
    @IBAction func MoreIcon(_ sender: UIButton) {
        
       
        delegate?.didButtonPressed()
        
    }
    
    
    @objc func LikeDisplay(_ sender: UITapGestureRecognizer){
        
        let vc: DisplayLikeVC  = Comment_STORYBOARD.instantiateViewController(withIdentifier: "LikeDisplay") as! DisplayLikeVC
        vc.tId = tid
        self.parent.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    class func instanceFromNib() -> ProfileTVC {
        return UINib(nibName: "ProfileTVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProfileTVC
    }
}
