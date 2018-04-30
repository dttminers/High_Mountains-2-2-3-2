//
//  ProfileWITVC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 08/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ProfileWITVC: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var Profileimg: UIView!
    @IBOutlet weak var lblLikeCount: UILabel!
    @IBOutlet weak var lblCommentCount: UILabel!
    @IBOutlet weak var lblShareCount: UILabel!

    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!

    func populate(_ data : TimelineModel) {
      // lblTitle.text = data.post

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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = self.img.frame.size.width/2
        img.clipsToBounds = true
    }




}

