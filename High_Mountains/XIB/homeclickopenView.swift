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
    
    
    var tid : String = ""
    var parent : UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 60.0
        
        
    }
    
    func populate(_ data : TimelineModel) {
        

        tid = data.timeline_id!
       // lblTitle.text = "Swapnil"
        proileImg.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
       // lblDate.text = data.time
        likeCount.text = "Liked by \(data.friend_like ?? "") and \(data.like_count!) others "
        // lblShareCount.text = "\(data.share_count!) Share"
        Postsimg.text = data.caption?.capitalized
        CommentCount.text = "View all \(data.comment_count ?? "0") Comment"
//        if data.isliked! == "true" {
//            btnLike.isSelected = true
//        }
//        else {
//            btnLike.isSelected = false
//        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.proileImg
    }
    
    
    class func instanceFromNib() -> homeclickopenView {
        return UINib(nibName: "homeclickopenView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! homeclickopenView
    }
}
