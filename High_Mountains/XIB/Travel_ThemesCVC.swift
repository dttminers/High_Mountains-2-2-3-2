//
//  Travel_ThemesCVC.swift
//  High_Mountains
//
//  Created by Abhishek on 11/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class Travel_ThemesCVC: UICollectionViewCell {

    @IBOutlet weak var ThemeImg: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
     var obj : TravelTheme!
    
    func populateData(_ data : TravelTheme) {
        obj = data
        ThemeImg.loadImageUsingCache(withUrl: data.theme_image!)
        lblTitle.text = data.title?.capitalized
    }
}
