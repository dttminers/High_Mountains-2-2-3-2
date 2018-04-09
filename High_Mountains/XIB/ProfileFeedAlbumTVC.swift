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
    
    func populate(_ data : TimelineModel) {
        lblTitle.text = data.caption
        var arrSource : [InputSource] = []
        let imgDt = data.image!.components(separatedBy: ",")
        for obj in imgDt {
            arrSource.append(KingfisherSource(urlString: "\(url)\(obj)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
        }
        imgPost.draggingEnabled = false
        imgPost.circular = true
        imgPost.setImageInputs(arrSource)
        
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
