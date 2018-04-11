//
//  All_DestinationTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 11/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class All_DestinationTVC: UITableViewCell {

    @IBOutlet weak var Des_img: UIImageView!
    @IBOutlet weak var lbl_Des: UILabel!
    
   var obj : AllDestination!
    
    func populateData(_ data : AllDestination) {
        obj = data
        Des_img.loadImageUsingCache(withUrl: data.image_url!)
        lbl_Des.text = data.country
    }
}
