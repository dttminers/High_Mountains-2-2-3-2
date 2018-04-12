//
//  ProfileFeedVC.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 08/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ProfileFeedVC: UIViewController {

    @IBOutlet weak var tableFeeds: UITableView!
    
    var timelineRes : [TimelineModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableFeeds.register(UINib(nibName : "ProfileTVC", bundle:nil), forCellReuseIdentifier: "ProfileTVC")
        tableFeeds.register(UINib(nibName : "ProfileWITVC", bundle:nil), forCellReuseIdentifier: "ProfileWITVC")
        tableFeeds.register(UINib(nibName : "ProfileFeedAlbumTVC", bundle:nil), forCellReuseIdentifier: "ProfileFeedAlbumTVC")
    }
    
}

extension ProfileFeedVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelineRes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if timelineRes[indexPath.row].activity == "photo" {
            let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
            cell.populate(timelineRes[indexPath.row])
            
            return cell
        }
        else if timelineRes[indexPath.row].activity == "album" {
            let cell : ProfileFeedAlbumTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileFeedAlbumTVC", for: indexPath) as! ProfileFeedAlbumTVC
            cell.populate(timelineRes[indexPath.row])
            
            return cell
        }
        else {
            let cell : ProfileWITVC = tableView.dequeueReusableCell(withIdentifier: "ProfileWITVC", for: indexPath) as! ProfileWITVC
            cell.populate(timelineRes[indexPath.row])
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
