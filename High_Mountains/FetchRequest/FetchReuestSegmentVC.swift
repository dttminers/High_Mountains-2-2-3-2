//
//  FetchReuestSegmentVC.swift
//  High_Mountains
//
//  Created by Abhishek on 25/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FetchReuestSegmentVC: UIViewController {
    
    @IBOutlet weak var TabbarView: UIView!
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var youView: UIView!
    
    @IBOutlet weak var ClickyouView: UIView!
    @IBOutlet weak var ClickFfollowingView: UIView!
    
    @IBOutlet weak var followingbtn: UIButton!
    @IBOutlet weak var youbtn: UIButton!
   
    @IBOutlet weak var ContainerView2: UIView!
    @IBOutlet weak var ContainerView: UIView!
    var selectedPhotoIndex : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

       TabbarActionbtn(followingbtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
        
    @IBAction func TabbarActionbtn(_ sender: UIButton) {
        
        selectedPhotoIndex = sender.tag
        if sender.tag == 1 {
            followingView.alpha = 1
            youView.alpha = 0
            ClickFfollowingView.alpha = 1
            ClickyouView.alpha = 0
            
            UIView.animate(withDuration: 0.3, animations: {
                self.ContainerView.alpha = 1.0
                self.ContainerView2.alpha = 0.0
            })
            
        }else if sender.tag == 2 {
            followingView.alpha = 0
            youView.alpha = 1
            ClickFfollowingView.alpha = 0
            ClickyouView.alpha = 1
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.ContainerView.alpha = 0.0
                self.ContainerView2.alpha = 1.0
                
                
            })
        }
        
        
}
    
}


