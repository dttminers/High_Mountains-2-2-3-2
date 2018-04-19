//
//  CommentTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 12/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class CommentTVC: UITableViewCell {

    @IBOutlet weak var Comment_img: UIImageView!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblmsgComment: UILabel!
    @IBOutlet weak var lblCommentRply: UILabel!
    @IBOutlet weak var lblCommentLike: UILabel!
    @IBOutlet weak var CommentDate: UILabel!
    
    var obj : SendComment!
    
    func populateData(_ data : SendComment) {
        obj = data
        AppUtility.setCornerRadius(Comment_img, radius: 25)
        if (data.profile_pic?.contains("uploads"))!{
        Comment_img.loadImageUsingCache(withUrl:"\(url)\(data.profile_pic!)")
        }else {
            self.Comment_img.loadImageUsingCache(withUrl:"\(data.profile_pic!)")
        }
        lblComment.text = data.username?.capitalized
        lblmsgComment.text = data.comment
        lblCommentRply.text = "\(data.reply_count ?? "0")Reply"
        lblCommentLike.text = "\(data.like_count ?? "0")Like"
       
   
    
}
}
