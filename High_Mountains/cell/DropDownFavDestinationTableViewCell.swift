//
//  DropDownFavDestinationTableViewCell.swift
//  High_Mountains
//
//  Created by Abhishek on 15/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class DropDownFavDestinationTableViewCell: UITableViewCell {
//table view 1
    @IBOutlet weak var Rentoutslbl: UILabel!
    @IBOutlet weak var Activiteslbl: UILabel!
    @IBOutlet weak var tourslbl: UILabel!
    @IBOutlet weak var RentoutsNolbl: UILabel!
    @IBOutlet weak var ActivitiesNolbl: UILabel!
    @IBOutlet weak var TourNolbl: UILabel!
    @IBOutlet weak var Descriptionlbl: UILabel!
    @IBOutlet weak var DropDestionNamelbl: UILabel!
    @IBOutlet weak var ImgDrpDwnfav: UIImageView!
    
    //table view2
    
    @IBOutlet weak var otherFeatureimg: UIImageView!
    
    @IBOutlet weak var Otherpacknamelbl: UILabel!
    
    @IBOutlet weak var otherpackpricelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
