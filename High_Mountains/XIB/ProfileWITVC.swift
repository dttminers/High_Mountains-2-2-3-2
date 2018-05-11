//
//  ProfileWITVC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 08/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ProfileWITVC: UITableViewCell,UIScrollViewDelegate {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var lblLikeCount: UILabel!
    @IBOutlet weak var lblCommentCount: UILabel!
    

    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnShare: UIButton!

    @IBOutlet weak var PageController: UIPageControl!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    var img123: [String] = ["ProfileImg"]
    var frame1 = CGRect(x: 0, y: 0, width: 0, height: 0)
    func populate(_ data : TimelineModel) {
      // lblTitle.text = data.post
        let imgDt = data.image!.components(separatedBy: ",")
     //  ProfileImg.loadImageUsingCache(withUrl: "\(url)\(data.image!)")
        lblLikeCount.text = "\(data.like_count!)"
     //   lblCommentCount.text = "\(data.comment_count!)"
        //lblShareCount.text = "\(data.share_count!)"
        
        if data.isliked! == "true" {
            btnLike.isSelected = true
        }
        else {
            btnLike.isSelected = false
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = self.img.frame.size.width/2
        img.clipsToBounds = true
        PageController.numberOfPages = img123.count
        
        for index in 0..<img123.count {
            frame1.origin.x = ScrollView.frame .size.width * CGFloat(index)
            frame1.size = ScrollView.frame.size
            let imageview = UIImageView(frame: frame1)
            imageview.image = UIImage(named: img123[index])
             self.ScrollView.addSubview(imageview)
        }
        ScrollView.contentSize = CGSize(width: (ScrollView.frame.size.width *  CGFloat(img123.count)), height: ScrollView.frame.size.height)
        ScrollView.delegate = self
    }

    func  scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = ScrollView.contentOffset.x/ScrollView.frame.size.width
        PageController.currentPage = Int(pageNumber)
    }


}

