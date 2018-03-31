//
//  CameraProfile2TableViewCell.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class CameraProfile2TableViewCell: UITableViewCell {

    @IBOutlet weak var profilepicimg: UIImageView!
    @IBOutlet weak var profilenamelbl: UILabel!
    @IBOutlet weak var dayslbl: UILabel!
    @IBOutlet weak var uploadimg: UIImageView!
    @IBOutlet weak var likeslbl: UILabel!
    @IBOutlet weak var commentlbl: UILabel!
    @IBOutlet weak var sharelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
