//
//  Share_PostsVC.swift
//  High_Mountains
//
//  Created by Abhishek on 24/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class Share_PostsVC: UIViewController {

    @IBOutlet weak var Postsimg: UIImageView!
    @IBOutlet weak var CaptionTxt: UITextField!
    
    var postimg = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
      Postsimg.image = postimg
       
    }

   
    
    @IBAction func btnShare(_ sender: Any) {
        
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let image : UIImage = Postsimg.image!
            
            //Now use image to create into NSData format
            let imageData:NSData = UIImagePNGRepresentation(image)! as NSData
            let strBase64:String = imageData.base64EncodedString(options: .lineLength64Characters)
            
            let postparam="image_url=\(strBase64)&&action=upload_image&&uid=\(userId)&&activity=photo&&tag_status=0&&location_status=0&&caption=\(CaptionTxt.text!)";
            
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)time_log.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    if let name = res["status"]as? Int as Optional!{
                        print(name!)
                        if (name == 1)
                        {
                            
                            print("Saved")
                            
                            self.alertDialog(header: "Alert", msg: "Update SuccessFul")
                            
                            
                        }
                            
                            
                        else if(name == 0){
                            let res = dt.object as AnyObject
                            if (res["type"]as? String) != nil{
                                self.alertDialog(header: "Alert", msg: "Sorry, only JPG, JPEG, PNG & GIF files are allowed.")
                                print("failed")
                            }
                        }
                        
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
    }
    


