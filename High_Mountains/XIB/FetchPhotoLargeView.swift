//
//  FetchPhotoLargeView.swift
//  High_Mountains
//
//  Created by Abhishek on 17/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FetchPhotoLargeView: UIView {

    @IBOutlet weak var lblshare: UIButton!
    @IBOutlet weak var lblcomment: UIButton!
    @IBOutlet weak var lbllike: UIButton!
    @IBOutlet weak var Profileimg: UIImageView!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbltitile: UILabel!
  
    @IBOutlet weak var sharebtn: UIButton!
    
    @IBOutlet weak var Commentbtn: UIButton!
    
    var obj : PhotoModel!
    
  @objc func populateData(_ data : PhotoModel) {
        obj = data
        AppUtility.setCornerRadius(Profileimg, radius: 25)
        Profileimg.loadImageUsingCache(withUrl:"\(url)\(data.image_url ?? "0")")
        
    }
}


