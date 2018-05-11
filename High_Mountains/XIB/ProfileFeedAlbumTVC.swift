//
//  ProfileFeedAlbumTVC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 10/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import ImageSlideshow

class ProfileFeedAlbumTVC: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgPost: ImageSlideshow!
    
    @IBOutlet weak var lblLikeCount: UILabel!
    @IBOutlet weak var lblCommentCount: UILabel!
    @IBOutlet weak var lblShareCount: UILabel!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    var tid : String = ""
    var parent : UIViewController!
    var obj2 : Any!
    var delegate1: Comment1?
    
    func populate(_ data : TimelineModel) {
        obj2 = data
        tid = data.timeline_id!
        lblTitle.text = data.caption
        var arrSource : [InputSource] = []
        let imgDt = data.image!.components(separatedBy: ",")
        for obj in imgDt {
            arrSource.append(KingfisherSource(urlString: "\(url)\(obj)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
        }
        imgPost.draggingEnabled = true
        imgPost.circular = false
        imgPost.setImageInputs(arrSource)
        imgPost.pageControlPosition = PageControlPosition.underScrollView
        imgPost.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        imgPost.pageControl.pageIndicatorTintColor = UIColor.black
        imgPost.contentScaleMode = UIViewContentMode.scaleAspectFill
        lblLikeCount.text = "Liked by \(data.friend_like ?? "") and \(data.like_count!) others "
        
        lblCommentCount.text = "View all \(data.comment_count ?? "0") Comment"
       
       // lblShareCount.text = "\(data.share_count!)"
        
        if data.isliked! == "true" {
            self.btnLike.setImage(UIImage(named:"like2"), for: .normal)
            self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
        }
        else {
            self.btnLike.setImage(UIImage(named:"like1"), for: .normal)
            self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
        }
    }
    func populate(_ data : PhotoModel) {
        
        obj2 = data
        //tid = data.timeline_id!
        lblTitle.text = data.caption
        var arrSource : [InputSource] = []
        let imgDt = data.image_url!.components(separatedBy: ",")
        for obj in imgDt {
            arrSource.append(KingfisherSource(urlString: "\(url)\(obj)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
        }
        imgPost.draggingEnabled = true
        imgPost.circular = false
        imgPost.setImageInputs(arrSource)
        imgPost.pageControlPosition = PageControlPosition.underScrollView
        imgPost.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        imgPost.pageControl.pageIndicatorTintColor = UIColor.black
        imgPost.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        lblCommentCount.text = "View all \(data.comment_count ?? "0") Comment"
        
        // lblShareCount.text = "\(data.share_count!)"
        
//        if data.isliked! == "true" {
//            self.btnLike.setImage(UIImage(named:"like2"), for: .normal)
//            self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
//        }
//        else {
//            self.btnLike.setImage(UIImage(named:"like1"), for: .normal)
//            self.btnLike.imageEdgeInsets = UIEdgeInsets(top: 3,left: 5,bottom: 3,right: 5)
//        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = self.img.frame.size.width/2
        img.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    @IBAction func btnComment(_ sender: Any) {
        if parent == nil {
            delegate1?.Commet(tid)
        }else{
            let controller : CommentVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "Comment") as! CommentVC
            controller.tId = tid
            self.parent.navigationController?.pushViewController(controller, animated: true)
        }
    }
    @IBAction func btnlike(_ sender: Any) {
        
        likeData(tid)
        
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
    
    class func instanceFromNib() -> ProfileFeedAlbumTVC {
        return UINib(nibName: "ProfileFeedAlbumTVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProfileFeedAlbumTVC
    }
}
