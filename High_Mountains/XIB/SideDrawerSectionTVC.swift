//
//  SideDrawerSectionTVC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 17/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class SideDrawerSectionTVC: UITableViewCell {

    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgArrow: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
