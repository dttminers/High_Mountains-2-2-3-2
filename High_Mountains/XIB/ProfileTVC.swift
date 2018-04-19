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
    @IBOutlet weak var lblCommentCount: UILabel!
    @IBOutlet weak var lblShareCount: UILabel!
    
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        img.layer.cornerRadius = self.img.frame.size.width/2
        img.clipsToBounds = true
    }
    var obj : Any!
    
    func populate(_ data : TimelineModel) {
        
        obj = data
        lblTitle.text = "Swapnil"
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
        lblDate.text = data.time
        lblLikeCount.text = "\(data.like_count!) Like"
        lblCommentCount.text = "\(data.comment_count!) Comment"
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
        lblTitle.text = "Swapnil"
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image_url!)")
        lblDate.text = data.time
        lblLikeCount.text = "\(data.like_count!) Like"
        lblCommentCount.text = "\(data.comment_count!) Comment"
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
    }
    
    @IBAction func btnCommentAction(_ sender: Any) {
    }
    
    @IBAction func btnShareAction(_ sender: Any) {
    }
    
    
    class func instanceFromNib() -> ProfileTVC {
        return UINib(nibName: "ProfileTVC", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProfileTVC
    }
}
