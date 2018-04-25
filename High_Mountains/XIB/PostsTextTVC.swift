//
//  PostsTextTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 18/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PostsTextTVC: UITableViewCell {

    @IBOutlet weak var lblpost: UILabel!


    @IBOutlet weak var lblcomment: UILabel!
    @IBOutlet weak var lbllikes: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var profileimg: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()

        let greet4Height = lblpost.optimalHeight
        lblpost.frame = CGRect(x: lblpost.frame.origin.x, y: lblpost.frame.origin.y, width: lblpost.frame.width, height: greet4Height)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     var obj : TimelineModel!

    func populateData(_ data : TimelineModel){
        obj = data
        if (obj.activity?.contains("post"))!{
        lbltime.text = obj.time
            lbllikes.text = "\(obj.like_count ?? "0") Likes"
            lblcomment.text = "\(obj.comment_count ?? "0") Commets"
        lblpost.text = obj.post
    }
    }

}


