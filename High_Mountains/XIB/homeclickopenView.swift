//
//  homeclickopenView.swift
//  High_Mountains
//
//  Created by Abhishek on 02/05/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class homeclickopenView: UIView,UIScrollViewDelegate{
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var proileImg: UIImageView!
    @IBOutlet weak var CommentCount: UILabel!
    @IBOutlet weak var Postsimg: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var profileimg: UIImageView!
    @IBOutlet weak var lbltim: UILabel!
    @IBOutlet weak var lbltitleName: UILabel!
    @IBOutlet weak var btnlike: UIButton!
    
    var tid : String = ""
    var parent : UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
         AppUtility.setCornerRadius(profileimg, radius: 25)
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 60.0
        
        
    }
    
    @IBAction func btnComment(_ sender: Any) {
        
        let controller : CommentVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "Comment") as! CommentVC
        controller.tId = tid
        self.parent.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func btnLike(_ sender: Any) {
        
        likeData(tid)
    }
    func populate(_ data : TimelineModel) {
        
        tid = data.timeline_id!
       lbltitleName.text = "Swapnil"
       proileImg.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
       lbltim.text = data.time
        likeCount.text = "Liked by \(data.friend_like ?? "") and \(data.like_count!) others "
        // lblShareCount.text = "\(data.share_count!) Share"
        Postsimg.text = data.caption?.capitalized
        CommentCount.text = "View all \(data.comment_count ?? "0") Comment"

    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.proileImg
    }
    
    func likeData(_ tid : String) {
        let postparam="action=like_data&&uid=\(userId)&&timeline_id=\(tid)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : AnyObject = dt.object as AnyObject
                    self.likeCount.text = "\(res["like Count"]!! as! String) Like"
                    if (res["msg"]!! as! String).contains("increase") {
                        self.btnlike.isSelected = true
                    }
                    else {
                        self.btnlike.isSelected = false
                    }
                }
                
            }
            else {
                //self.alertDialog(msg: result as! String)
            }
        })
    }
    
    class func instanceFromNib() -> homeclickopenView {
        return UINib(nibName: "homeclickopenView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! homeclickopenView
    }
}
