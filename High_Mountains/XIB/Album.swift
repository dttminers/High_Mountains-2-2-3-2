//
//  Album.swift
//  High_Mountains
//
//  Created by Abhishek on 09/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class Album: UICollectionViewCell {

    @IBOutlet weak var imgPost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func populate(_ data : PhotoModel) {
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image_url!)")
        
    }
}
