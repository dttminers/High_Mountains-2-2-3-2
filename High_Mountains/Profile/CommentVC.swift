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
    
  var Comment: [SendComment] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()

        if let Comment = Bundle.main.loadNibNamed("CommentsendView", owner: self, options: nil)?.first as?CommentsendView {
            Comment.bbtn.addTarget(self, action: #selector(CommentVC.sendComment(sender:)) , for: .touchUpInside)
            //Comment.frame.origin.y = 667
            
            self.commentview?.addSubview(Comment)
        }
        tableview?.register(UINib(nibName : "CommentTVC", bundle:nil), forCellReuseIdentifier: "CommentTVC")
        self.URLDownload()
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
 
    @objc func sendComment(sender:UIButton)
    {
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
        
            let postparam = "action=comment_data&&uid=26&&timeline_id=101&&comment=goaiabhi";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    if let name = res["msg"]as?String{
                        print(name)
                       
                        
                        
                    }
                    
                  
                    
                    
                }
                else {
                    self.alertDialog(msg: result as! String)
                }
                
            })
            
        }else {
            print("There is no internet connection")
        }
    }
    
    func URLDownload()
    {
         if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
        let postparam = "action=fetch_comment&&timeline_id=101";
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


