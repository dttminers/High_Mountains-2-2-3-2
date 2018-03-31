//
//  profileTableViewCell.swift
//  High_Mountains
//
//  Created by Abhishek on 08/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class profileTableViewCell: UITableViewCell {

   
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var profileimg: UIImageView!
    @IBOutlet weak var profilenamelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



