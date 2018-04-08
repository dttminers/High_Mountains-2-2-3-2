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
    
    var feedRes : [FollowModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableFeeds.register(UINib(nibName : "ProfileTVC", bundle:nil), forCellReuseIdentifier: "ProfileTVC")
        tableFeeds.register(UINib(nibName : "ProfileWITVC", bundle:nil), forCellReuseIdentifier: "ProfileWITVC")
    }
    
}

extension ProfileFeedVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedRes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
