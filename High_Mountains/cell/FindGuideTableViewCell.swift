//
//  FindGuideTableViewCell.swift
//  High_Mountains
//
//  Created by Abhishek on 14/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FindGuideTableViewCell: UITableViewCell {


    
    @IBOutlet weak var FindGuidePricelbl: UILabel!
    @IBOutlet weak var FindGuideNamelbl: UILabel!
    @IBOutlet weak var FindGuideimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


