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
    
    @IBOutlet weak var LArgeImgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let viewN =  ProfileTVC.instanceFromNib() as ProfileTVC
        viewN.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)//nav.frame
        viewN.populate(obj)
        viewN.btnComment.addTarget(self, action: #selector(ClickLargeImgVC.sendComment(sender:)) , for: .touchUpInside)
        viewN.btnShare.addTarget(self, action: #selector(ClickLargeImgVC.share(sender:)) , for: .touchUpInside)
        viewN.bringSubview(toFront: self.view)
        LArgeImgView.addSubview(viewN)
        
        /*if let Comment: FetchPhotoLargeView = Bundle.main.loadNibNamed("FetchPhotoLargeView", owner: self, options: nil)?.first as?FetchPhotoLargeView{
         Comment.Commentbtn.addTarget(self, action: #selector(ClickLargeImgVC.sendComment(sender:)) , for: .touchUpInside)
         Comment.sharebtn.addTarget(self, action: #selector(ClickLargeImgVC.share(sender:)) , for: .touchUpInside)
            //Comment.Profileimg.loadImageUsingCache(withUrl: ("\(url)\(image_url!)")
            //Comment.frame.origin.y = 667
            self.URLDownload()
            self.LArgeImgView.addSubview(Comment)
            
        }*/
     
    }

    func likeData(_ tid : String) {
        let postparam="action=like_data&&uid=\(userId)&&timeline_id=\(tid)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : AnyObject = dt.object as AnyObject
                    
                }
                
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
  
    @objc func btnLikeAction(sender:UIButton)
    {
        likeData(obj.timeline_id!)
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
