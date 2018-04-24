//
//  CommentVC.swift
//  High_Mountains
//
//  Created by Abhishek on 16/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class CommentVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var commentview: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tet: UITextField!
    @IBOutlet weak var bbtn: UIButton!
    
    var Comment: [SendComment] = []
    
    var tId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview?.register(UINib(nibName : "CommentTVC", bundle:nil), forCellReuseIdentifier: "CommentTVC")
        self.getComments()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Comment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CommentTVC = tableView.dequeueReusableCell(withIdentifier: "CommentTVC", for: indexPath) as! CommentTVC
        cell.populateData(Comment[indexPath.row])
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func Sendbutton(_ sender: Any) {
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let postparam = "action=comment_data&&uid=26&&timeline_id=\(tId)&&comment=\(tet.text!)";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    print(res)
                    
                    
                    
                }
                else {
                    print("msg: result as! String")
                }
                
            })
            
        }else {
            print("There is no internet connection")
        }
        
    }
    
    func getComments()
    {
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            let postparam = "action=fetch_comment&&timeline_id=\(tId)";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    let res : [AnyObject] = dt.object as! [AnyObject]
                    print(res)
                    
                    self.Comment = DATA_MANAGER.sendCommentDictionary(res)
                    self.tableview?.reloadData()
                }
                else {
                    self.alertDialog(msg: result as! String)
                }
            })
        }
        
    }
    
    
}


