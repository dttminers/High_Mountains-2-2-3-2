//
//  LargeClickAlbumVC.swift
//  High_Mountains
//
//  Created by Abhishek on 11/05/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class LargeClickAlbumVC: UIViewController {
 var obj1: TimelineModel!
  var obj : PhotoModel!
    
    @IBOutlet weak var LargeClickAlbumView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
            
            let viewN =  ProfileFeedAlbumTVC.instanceFromNib() as ProfileFeedAlbumTVC
            // viewN.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)//nav.frame
            
            viewN.populate(obj)
            
            viewN.parent = self
            //viewN.btnComment.addTarget(self, action: #selector(ClickLargeImgVC.sendComment(sender:)) , for: .touchUpInside)
            viewN.btnShare.addTarget(self, action: #selector(ClickLargeImgVC.share(sender:)) , for: .touchUpInside)
            viewN.bringSubview(toFront: self.view)
            LargeClickAlbumView.addSubview(viewN)
            
        }
    override func viewWillAppear(_ animated: Bool) {
        
        
        navigationController?.navigationBar.showView((self.navigationController?.navigationBar)!, navigationItem: navigationItem, navigationController: self.navigationController!, isBack: 0,  lblheading: "")
        
    }
    
    @objc func sendComment(sender:UIButton)
    {
        let storyboard = UIStoryboard(name: "Comment", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Comment")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @objc func share(sender:UIButton){
        let activityVC = UIActivityViewController(activityItems:["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC,animated: true,completion: nil)
    }
    
}


  


