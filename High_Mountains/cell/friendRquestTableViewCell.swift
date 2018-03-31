//
//  friendRquestTableViewCell.swift
//  High_Mountains
//
//  Created by Abhishek on 09/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class friendRquestTableViewCell: UITableViewCell {

    @IBOutlet weak var fReqimg: UIImageView!
    @IBOutlet weak var frndReqlbl: UILabel!
    @IBOutlet weak var commentlbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.fReqimg.layer.cornerRadius = self.fReqimg.frame.size.width/2
        fReqimg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
