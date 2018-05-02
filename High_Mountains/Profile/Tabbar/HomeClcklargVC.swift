//
//  HomeClcklargVC.swift
//  High_Mountains
//
//  Created by Abhishek on 26/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class HomeClcklargVC: UIViewController {
  
   
    var obj1 : TimelineModel!
    
  
    @IBOutlet weak var imgview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewN =  ProfileTVC.instanceFromNib() as ProfileTVC
       // viewN.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)//nav.frame
        viewN.populate(obj1)
        viewN.parent = self
      viewN.btnComment.addTarget(self, action: #selector(ClickLargeImgVC.sendComment(sender:)) , for: .touchUpInside)
        viewN.btnShare.addTarget(self, action: #selector(ClickLargeImgVC.share(sender:)) , for: .touchUpInside)
        viewN.bringSubview(toFront: self.view)
        imgview.addSubview(viewN)
        
        
    }
    
   
}
