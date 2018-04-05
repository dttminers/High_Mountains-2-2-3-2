//
//  FollowListTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 05/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FollowListTVC: UITableViewCell {

    @IBOutlet weak var CommonFriendCountLBL: UILabel!
    @IBOutlet weak var FollowNameLBL: UILabel!
    @IBOutlet weak var FollowProfileIMG: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func FollowButtonBtn(_ sender: Any) {
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
