//
//  AlbumTitle.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 16/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class AlbumTitle: UICollectionViewCell {

    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(_ data : PhotoModel) {
        let imgDt = data.image_url!.components(separatedBy: ",")
        if imgDt.count > 0 {
            imgPost.loadImageUsingCache(withUrl: "\(url)\(imgDt[0])")
        }
        
        lblTitle.text = data.caption
    }
    
    func populate(_ data : TimelineModel) {
        let imgDt = data.image!.components(separatedBy: ",")
        if imgDt.count > 0 {
            imgPost.loadImageUsingCache(withUrl: "\(url)\(imgDt[0])")
        }
        imgPost.loadImageUsingCache(withUrl: "\(url)\(data.image ?? "")")
        lblTitle.text = data.caption ?? "PUB"
    }
}
