//
//  ProfileTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 04/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ProfileTVC: UITableViewCell {

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
    
    func populate(_ data : TimelineModel) {
        lblTitle.text = data.caption
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
        lblDate.text = data.time
        lblLikeCount.text = "\(data.like_count!)"
        lblCommentCount.text = "\(data.comment_count!)"
        lblShareCount.text = "\(data.share_count!)"
        
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
