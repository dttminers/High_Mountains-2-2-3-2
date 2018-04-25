//
//  Displayfetch_imgVC.swift
//  High_Mountains
//
//  Created by Abhishek on 25/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class Displayfetch_imgVC: UIViewController {

    @IBOutlet weak var FetchImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

      URLDownload()
    }

    func URLDownload()
    {
        let postparam = "action=follow_request_fetch&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)follow_data.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res[0]["profile_pic"] as! String)
                
                var vs = res[0]["profile_pic"] as! String
               
        
                
               
                
            }
                
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    
    
    
    
}

    

 

