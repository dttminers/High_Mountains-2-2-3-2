//
//  ClickLargeImgVC.swift
//  High_Mountains
//
//  Created by Abhishek on 17/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ClickLargeImgVC: UIViewController {
    
    //var Image: [PhotoModel] = []
    var obj : PhotoModel!
    var obj1: TimelineModel!
    var selectedPhotoIndex : Int = 1
    @IBOutlet weak var LArgeImgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewN =  ProfileTVC.instanceFromNib() as ProfileTVC
        
        // viewN.frame = CGRect(x: 0, y: 0, width: 0, height: self.view.frame.size.height)//nav.frame
        if obj == nil {
            viewN.populate(obj1)
        }
        else {
            viewN.populate(obj)
        }
        
        
        
        viewN.parent = self
        //viewN.btnComment.addTarget(self, action: #selector(ClickLargeImgVC.sendComment(sender:)) , for: .touchUpInside)
        viewN.btnShare.addTarget(self, action: #selector(ClickLargeImgVC.share(sender:)) , for: .touchUpInside)
        viewN.bringSubview(toFront: self.view)
        LArgeImgView.addSubview(viewN)
        
        

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

