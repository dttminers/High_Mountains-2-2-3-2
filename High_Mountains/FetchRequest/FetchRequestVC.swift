//
//  FetchRequestVC.swift
//  High_Mountains
//
//  Created by Abhishek on 09/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FetchRequestVC: UIViewController{

    @IBOutlet weak var tableview: UITableView!
    
     var fetchreq : [FetchRequest] = []
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

       tableview?.register(UINib(nibName : "FollowingRequestsTVC", bundle:nil), forCellReuseIdentifier: "FollowingRequestsTVC")
        self.URLDownload()
    }

    func URLDownload()
    {
        let postparam = "action=follow_request_fetch&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)follow_data.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res)
                
                self.fetchreq = DATA_MANAGER.setFetchRequestDictionary(res)
                self.tableview?.reloadData()
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }

 
    

}

extension FetchRequestVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchreq.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FollowingRequestsTVC = tableView.dequeueReusableCell(withIdentifier: "FollowingRequestsTVC", for: indexPath) as! FollowingRequestsTVC
       cell.populateData(fetchreq[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

