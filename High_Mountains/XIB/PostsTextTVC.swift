//
//  PostsTextTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 18/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PostsTextTVC: UITableViewCell {
    
    
    @IBOutlet weak var lbltext: UITextField!
    @IBOutlet weak var lblcomment: UILabel!
    @IBOutlet weak var lbllikes: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lbltitle: UILabel!
    @IBOutlet weak var profileimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     var obj : TimelineModel!
    
    func populateData(_ data : TimelineModel){
        
        obj = data
        profileimg.loadImageUsingCache(withUrl: data.image!)
        lbltime.text = data.time
        lbllikes.text = data.like_count
        lblcomment.text = data.comment_count
        lbltext.text = data.post
    }
}
