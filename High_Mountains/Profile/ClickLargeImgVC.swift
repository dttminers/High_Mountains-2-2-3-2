//
//  ClickLargeImgVC.swift
//  High_Mountains
//
//  Created by Abhishek on 17/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ClickLargeImgVC: UIViewController {
 
     var Image: [PhotoModel] = []
       var obj : PhotoModel!
    
    @IBOutlet weak var LArgeImgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let Comment: FetchPhotoLargeView = Bundle.main.loadNibNamed("FetchPhotoLargeView", owner: self, options: nil)?.first as?FetchPhotoLargeView{
         Comment.Commentbtn.addTarget(self, action: #selector(ClickLargeImgVC.sendComment(sender:)) , for: .touchUpInside)
         Comment.sharebtn.addTarget(self, action: #selector(ClickLargeImgVC.share(sender:)) , for: .touchUpInside)
            //Comment.Profileimg.loadImageUsingCache(withUrl: obj.("\(url)\(image_url!)")
            //Comment.lbltitile.text = obj!.username
            //Comment.frame.origin.y = 667
            self.URLDownload()
            self.LArgeImgView.addSubview(Comment)
        }
       
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func URLDownload()
    {
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            let postparam = "action=fetch_photos&&uid=2";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    let res : [AnyObject] = dt.object as! [AnyObject]
                    self.Image = DATA_MANAGER.setPhotoDictionary(res)
                }
                
                else {
                    self.alertDialog(msg: result as! String)
                }
            })
        }
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
