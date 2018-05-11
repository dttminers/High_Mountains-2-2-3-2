//
//  PhotoAlbumCVC.swift
//  High_Mountains
//
//  Created by Abhishek on 25/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
protocol  delete {
    
    func deleteCell(indx: Int)
}
class PhotoAlbumCVC: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    var delegate: delete!
    var index: IndexPath!
    
    @IBAction func deleteimgCell(_ sender: Any) {
        
        delegate?.deleteCell(indx: index.row)
    }
    
    
}
