//
//  HomeClcklargVC.swift
//  High_Mountains
//
//  Created by Abhishek on 26/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class HomeClcklargVC: UIViewController {

    @IBOutlet weak var DisplayimgView: UIView!
    var obj : TimelineModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewN =  ProfileTVC.instanceFromNib() as ProfileTVC
        viewN.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)//nav.frame
        viewN.populate(obj)
        viewN.parent = self
        viewN.bringSubview(toFront: self.view)
       DisplayimgView.addSubview(viewN)
    }

    
    

}
