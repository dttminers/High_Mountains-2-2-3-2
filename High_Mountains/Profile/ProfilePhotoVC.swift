//
//  ProfilePhotoVC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 11/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ProfilePhotoVC: UIViewController {

    @IBOutlet weak var vewGrid: UIView!
    @IBOutlet weak var vewList: UIView!
    @IBOutlet weak var vewAlbum: UIView!
    @IBOutlet weak var vewGroup: UIView!
    
    @IBOutlet weak var btnGrid: UIButton!
    @IBOutlet weak var btnList: UIButton!
    @IBOutlet weak var btnAlbum: UIButton!
    @IBOutlet weak var btnGroup: UIButton!
    
    @IBOutlet weak var tableFeeds: UITableView!
    @IBOutlet weak var collectionFeeds: UICollectionView!
    
    var timelineRes : [TimelineModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tableFeeds.register(UINib(nibName : "ProfileTVC", bundle:nil), forCellReuseIdentifier: "ProfileTVC")
        
        btnFeedsActbtn(btnGrid)
    }

    @IBAction func btnTap(_ sender: UITapGestureRecognizer) {
        print("################################")
    }
    @IBAction func btnFeedsActbtn(_ sender: UIButton) {
        if sender.tag == 1 {
            vewGrid.alpha = 1
            vewList.alpha = 0
            vewAlbum.alpha = 0
            vewGroup.alpha = 0
            tableFeeds.isHidden = true
            collectionFeeds.isHidden = false
        }
        else if sender.tag == 2 {
            vewGrid.alpha = 0
            vewList.alpha = 1
            vewAlbum.alpha = 0
            vewGroup.alpha = 0
            tableFeeds.isHidden = true
            tableFeeds.reloadData()
        }
        else if sender.tag == 3 {
            vewGrid.alpha = 0
            vewList.alpha = 0
            vewAlbum.alpha = 1
            vewGroup.alpha = 0
        }
        else if sender.tag == 4 {
            vewGrid.alpha = 0
            vewList.alpha = 0
            vewAlbum.alpha = 0
            vewGroup.alpha = 1
        }
    }
}

extension ProfilePhotoVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelineRes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
        cell.populate(timelineRes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
