//
//  ProfileDetailsViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit



class ProfileDetailsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //bar iteam
    
    @IBOutlet weak var view2: UIView!
    
    //
    @IBOutlet weak var ProfileIMG: UIImageView!
    
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var FollowingAction_lbl: UILabel!
    
    @IBOutlet weak var UserNamelbl: UILabel!
    
    //indroduction yourself
    
    
    @IBOutlet weak var LiveInlbl: UILabel!
    @IBOutlet weak var Fromlbl: UILabel!
    @IBOutlet weak var Genderlbl: UILabel!
    @IBOutlet weak var RelationStatuslbl: UILabel!
    @IBOutlet weak var Doblbl: UILabel!
    @IBOutlet weak var Biolbl: UILabel!
    @IBOutlet weak var FavTravlQuoteslbl: UILabel!
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    //Feeds Button And Views
    @IBOutlet weak var vewFeeds: UIView!
    @IBOutlet weak var vewPhotoFeeds: UIView!
    @IBOutlet weak var vewNotesFeeds: UIView!
    
    @IBOutlet weak var stackVew: UIStackView!
    @IBOutlet weak var htConst: NSLayoutConstraint!
    
    var userInfo : UserInfoModel!
    
    var selectedIndex: Int = 0
    var viewControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadJsonWithURL()
        //  self.loadDesign()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileDetailsVC.ImageTapped(_:)))
        ProfileIMG.addGestureRecognizer(tapGesture)
        ProfileIMG.isUserInteractionEnabled = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileDetailsVC.Following(_:)))
        FollowingAction_lbl.addGestureRecognizer(tap)
        FollowingAction_lbl.isUserInteractionEnabled = true
        
        let tapF = UITapGestureRecognizer(target: self, action: #selector(ProfileDetailsVC.Follow(_:)))
        lblFollowers.addGestureRecognizer(tapF)
        lblFollowers.isUserInteractionEnabled = true
    }
    
    
    @objc func Following(_ sender: UITapGestureRecognizer)
    {
        let vc : FollowVC = SECOND_STORYBOARD.instantiateViewController(withIdentifier: "Following") as! FollowVC
        vc.ListType = "following"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func Follow(_ sender: UITapGestureRecognizer)
    {
        let vc : FollowVC = SECOND_STORYBOARD.instantiateViewController(withIdentifier: "Following") as! FollowVC
        vc.ListType = "follower"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
    
    //pop button action
    @IBAction func PopUpActbtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Popup") as! PopMenuViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
    
    @IBAction func btnFeedsActbtn(_ sender: UIButton) {
        if sender.tag == 1 {
            vewFeeds.alpha = 1
            vewPhotoFeeds.alpha = 0
            vewNotesFeeds.alpha = 0
            
            let vc : ProfileFeedVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ProfileFeedVC") as! ProfileFeedVC
            self.addChildViewController(vc)
            vc.view.frame = CGRect(x: 0.0, y: 0.0, width: stackVew.frame.size.width, height: 100)
            stackVew.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            htConst.constant = 100
        }
        else if sender.tag == 2 {
            vewFeeds.alpha = 0
            vewPhotoFeeds.alpha = 1
            vewNotesFeeds.alpha = 0
        }
        else if sender.tag == 3 {
            vewFeeds.alpha = 0
            vewPhotoFeeds.alpha = 0
            vewNotesFeeds.alpha = 1
        }
    }
    
    @objc func ImageTapped(_ sender: UITapGestureRecognizer)
    {
        print("imaged Tapped")
        let alert = UIAlertController(title: "Add Photo !", message: nil, preferredStyle: .alert)
        let camera = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: {ACTION in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        })
        
        let Photolib = UIAlertAction(title: "Choose from Library", style: UIAlertActionStyle.default, handler: {ACTION in
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(camera)
        alert.addAction(Photolib)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ProfileIMG.contentMode = .scaleToFill
            ProfileIMG.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    func downloadJsonWithURL() {
        
        
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let postparam="action=user_info_display&&uid=\(userId)";
            
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    self.userInfo = DATA_MANAGER.setUserInfoDictionary(res)
                    self.populateUserData()
                }
                else {
                    self.alertDialog(msg: result as! String)
                }
            })
            
        }else {
            print("There is no internet connection")
        }
    }
    
    func populateUserData() {
        if userInfo != nil {
            LiveInlbl.text = userInfo.lives_in
            Fromlbl.text = userInfo.from_des
            Genderlbl.text = userInfo.gender
            RelationStatuslbl.text = userInfo.relationship_status
            Doblbl.text = userInfo.dob
            Biolbl.text = userInfo.bio
            FavTravlQuoteslbl.text = userInfo.fav_quote
        }
    }
}

