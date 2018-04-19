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
    var obj : TimelineModel!
    func populate(_ data : TimelineModel) {
        
        obj = data
        lblTitle.text = "Swapnil"
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
        lblDate.text = obj.time
        lblLikeCount.text = "\(obj.like_count!) Like"
        lblCommentCount.text = "\(obj.comment_count!) Comment"
        lblShareCount.text = "\(obj.share_count!) Share"
        lblbPhotoTItle.text = obj.caption?.capitalized
        if data.isliked! == "true" {
            btnLike.isSelected = true
        }
        else {
            btnLike.isSelected = false
        }
    }
    
        
    @IBAction func btnLikeAction(_ sender: Any) {
    }
    
}
