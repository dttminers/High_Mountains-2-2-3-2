//
//  NotificationTableViewCell.swift
//  High_Mountains
//
//  Created by Abhishek on 10/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell{
    

    

    @IBOutlet weak var NotTourlbl: UILabel!
    @IBOutlet weak var Notificationlbl: UILabel!
    @IBOutlet weak var Notificationimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.Notificationimg.layer.cornerRadius = self.Notificationimg.frame.size.width/2
        Notificationimg.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
