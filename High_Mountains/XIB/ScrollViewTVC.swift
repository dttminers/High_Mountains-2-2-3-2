//
//  ScrollViewTVC.swift
//  High_Mountains
//
//  Created by Abhishek on 06/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ScrollViewTVC: UITableViewCell {

    @IBOutlet weak var Scroll_IMG: UIImageView!
    @IBOutlet weak var PageController: UIPageControl!
    
     var tid : String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        for Scroll_IMG in 0...5 {
            
            let imagetoDisplay = UIImage(named: "\(Scroll_IMG)")
            let imageview = UIImageView(image: imagetoDisplay)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate(_ data : TimelineModel) {
        
       // obj = data
        tid = data.timeline_id!
       // lblTitle.text = "Swapnil"
        Scroll_IMG.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
        
    }
    
    
    
}
