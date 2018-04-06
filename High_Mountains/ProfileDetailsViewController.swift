//
//  ProfileDetailsViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit



class ProfileDetailsViewController: UIViewController,UIImagePickerControllerDelegate {

  
    @IBOutlet weak var ProfileIMG: UIImageView!
    @IBOutlet weak var segment1: UISegmentedControl!
    
    
    
  /*  @IBAction func segmentaction(_ sender: Any) {
        
        if segment1.selectedSegmentIndex == 0
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "camera")
            self.present(controller, animated: true, completion: nil)
            
            
        }
       
    }*/
    
    
    
    @IBOutlet weak var UserNamelbl: UILabel!
    //indroduction yourself
    @IBOutlet weak var Biolbl: UILabel!
    @IBOutlet weak var FavTravlQuoteslbl: UILabel!
    @IBOutlet weak var Doblbl: UILabel!
    @IBOutlet weak var LiveInlbl: UILabel!
    @IBOutlet weak var Fromlbl: UILabel!
    @IBOutlet weak var Genderlbl: UILabel!
    @IBOutlet weak var RelationStatuslbl: UILabel!
    @IBOutlet weak var ScrollView: UIScrollView!
    
    //declaration
    //var profileDetails = [profile]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.downloadJsonWithURL()
        //  self.loadDesign()
        
       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileDetailsViewController.ImageTapped(_:)))
        ProfileIMG.addGestureRecognizer(tapGesture)
        ProfileIMG.isUserInteractionEnabled = true
       
        }
    
   
   


    //pop button action
    @IBAction func PopUpActbtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Popup") as! PopMenuViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
    
    
    @objc func ImageTapped(_ sender: UITapGestureRecognizer)
    {
        print("imaged Tapped")
        let alert = UIAlertController(title: "Image", message: "Image Change", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: {ACTION in self.ProfileIMG.image = UIImage(named: "download")
        })
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
        
        
        
    }

    
    
  func downloadJsonWithURL() {
    
  
    if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
        
          let postparam="action=user_info_display&&uid=2";
        
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                let res : AnyObject = dt.object as AnyObject
                if let name = res["lives_in"] as? String{
                    print(name)
                    DispatchQueue.main.async {
                        self.LiveInlbl.text = name
                     }
                }
                if let name = res["from"] as? String{
                    print(name)
                    DispatchQueue.main.async {
                        self.Fromlbl.text = name
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
                    
