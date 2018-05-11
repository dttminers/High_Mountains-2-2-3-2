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
    
    @IBOutlet weak var lblPosts: UILabel!
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
    
    @IBOutlet weak var btnFeeds: UIButton!
    @IBOutlet weak var btnPhotoFeeds: UIButton!
    @IBOutlet weak var btnNotesFeeds: UIButton!
    
    @IBOutlet weak var stackVew: UIStackView!
    @IBOutlet weak var htTableConst: NSLayoutConstraint!
    @IBOutlet weak var htCollectionConst: NSLayoutConstraint!
    
    @IBOutlet weak var vewPhotoTabs: UIView!
    
    @IBOutlet weak var vewGrid: UIView!
    @IBOutlet weak var vewList: UIView!
    @IBOutlet weak var vewAlbum: UIView!
    @IBOutlet weak var vewGroup: UIView!
    
    @IBOutlet weak var btnGrid: UIButton!
    @IBOutlet weak var btnList: UIButton!
    @IBOutlet weak var btnAlbum: UIButton!
    @IBOutlet weak var btnGroup: UIButton!
    
    @IBOutlet weak var tableFeeds: UITableView!
    @IBOutlet weak var collectionFeeds: UICollectionView!
    
    var userInfo : UserInfoModel!
    
    var timelineRes : [TimelineModel] = []
    var photoRes : [PhotoModel] = []
    var selectedIndex : Int = 1
    var selectedPhotoIndex : Int = 1
    var fullName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userInfoDisplay()
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
        
        tableFeeds.register(UINib(nibName : "ProfileTVC", bundle:nil), forCellReuseIdentifier: "ProfileTVC")
        tableFeeds.register(UINib(nibName : "ProfileWITVC", bundle:nil), forCellReuseIdentifier: "ProfileWITVC")
        tableFeeds.register(UINib(nibName : "ProfileFeedAlbumTVC", bundle:nil), forCellReuseIdentifier: "ProfileFeedAlbumTVC")
        collectionFeeds.register(UINib(nibName : "Album", bundle:nil), forCellWithReuseIdentifier: "Album")
        collectionFeeds.register(UINib(nibName : "AlbumTitle", bundle:nil), forCellWithReuseIdentifier: "AlbumTitle")
        
        btnPhotoFeedsActbtn(btnGrid)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.showView((self.navigationController?.navigationBar)!, navigationItem: navigationItem, navigationController: self.navigationController!, isBack: 4, lblheading: "\(fullName)")
        
    }
    // MARK: Button Actions
    
    @objc func Following(_ sender: UITapGestureRecognizer)
    {
        let vc : FollowVC = SECOND_STORYBOARD.instantiateViewController(withIdentifier: "Following") as! FollowVC
        vc.ListType = "following"
        self.navigationController?.show(vc, sender: nil)
    }
    
    @objc func Follow(_ sender: UITapGestureRecognizer)
    {
        let vc : FollowVC = SECOND_STORYBOARD.instantiateViewController(withIdentifier: "Following") as! FollowVC
        vc.ListType = "follower"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //pop button action
    @IBAction func PopUpActbtn(_ sender: Any) {
        let controller = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "Popup")
        self.navigationController?.showDetailViewController(controller, sender: nil)
        
    }
    
    @IBAction func btnPhotoFeedsActbtn(_ sender: UIButton) {
        selectedPhotoIndex = sender.tag
        if sender.tag == 1 {
            photoRes = []
            collectionFeeds.reloadData()
            fetchPhotos()
            vewGrid.alpha = 1
            vewList.alpha = 0
            vewAlbum.alpha = 0
            vewGroup.alpha = 0
           tableFeeds.isHidden = true
            collectionFeeds.isHidden = false
        }
        else if sender.tag == 2 {
            photoRes = []
            tableFeeds.reloadData()
            fetchPhotos()
            vewGrid.alpha = 0
            vewList.alpha = 1
            vewAlbum.alpha = 0
            vewGroup.alpha = 0
            tableFeeds.isHidden = false
            collectionFeeds.isHidden = true
            self.tableFeeds.reloadData()
            self.htTableConst.constant = self.tableViewHeight
        }
        else if sender.tag == 3 {
            timelineRes = []
            collectionFeeds.reloadData()
            fetchTagData()
            vewGrid.alpha = 0
            vewList.alpha = 0
            vewAlbum.alpha = 1
            vewGroup.alpha = 0
            tableFeeds.isHidden = true
            collectionFeeds.isHidden = false
        }
        else if sender.tag == 4 {
            photoRes = []
            collectionFeeds.reloadData()
            fetchAlbum()
            vewGrid.alpha = 0
            vewList.alpha = 0
            vewAlbum.alpha = 0
            vewGroup.alpha = 1
            tableFeeds.isHidden = true
            collectionFeeds.isHidden = false
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
    
    //MARK: API Requests
    
    func userInfoDisplay() {
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            let postparam="action=user_info_display&&uid=\(userId)";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    self.userInfo = DATA_MANAGER.setUserInfoDictionary(res)
                    self.populateUserData()
                    
                    if let Fullname = res["full_name"] as? String{
                        
                        self.fullName = Fullname
                        
                    }
                    if let ProfileImg = res["profile_pic"] as? String{
                        
                        self.ProfileIMG.loadImageUsingCache(withUrl: "\(url)\(ProfileImg)")
                        
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
    
    func fetchTimeline() {
        let postparam="action=fetch_timeline&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : [AnyObject] = dt.object as! [AnyObject]
                    self.timelineRes = DATA_MANAGER.setTimelineDictionary(res)
                    //self.setTimeline(model)
                    self.tableFeeds.reloadData()
                    self.htTableConst.constant = SCREEN_HEIGHT
                        //self.tableViewHeight
                }
                
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    
    func fetchPhotos() {
        let postparam="action=fetch_photos&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : [AnyObject] = dt.object as! [AnyObject]
                    self.photoRes = DATA_MANAGER.setPhotoDictionary(res)
                    //self.setPhotos(model)
                    if self.selectedPhotoIndex == 1 {
                        self.collectionFeeds.reloadData()
                       self.htCollectionConst.constant = self.collectionViewHeight
                    }
                    else if self.selectedPhotoIndex == 2 {
                        self.tableFeeds.reloadData()
                        self.htTableConst.constant = SCREEN_HEIGHT
                            //self.tableViewHeight
                    }
                    
                    
                }
                
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    
    func fetchAlbum() {
        let postparam="action=fetch_albums&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : [AnyObject] = dt.object as! [AnyObject]
                    self.photoRes = DATA_MANAGER.setPhotoDictionary(res)
                    //self.setPhotos(model)
                    
                    self.collectionFeeds.reloadData()
                    self.htCollectionConst.constant = self.collectionViewHeight
                }
                
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    
    func fetchTagData() {
        let postparam="action=tag_data&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt == nil {
                    let res : [AnyObject] = dt.object as! [AnyObject]
                    self.timelineRes = DATA_MANAGER.setTimelineDictionary(res)
                    //self.setPhotos(model)
                    self.collectionFeeds.reloadData()
                    self.htCollectionConst.constant = self.collectionViewHeight
                }
                
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    
    func likeData(_ tid : String, completionHandler: @escaping (_ result: Any) -> Void) {
        let postparam="action=like_data&&uid=\(userId)&&timeline_id=\(tid)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)like_share_comment.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                print(dt)
                if dt != nil {
                    let res : AnyObject = dt.object as AnyObject
                    completionHandler(res)
                }
                
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    
    func setTimeline(_ tableFeeds : [TimelineModel]) {
        let vc : ProfileFeedVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ProfileFeedVC") as! ProfileFeedVC
        vc.timelineRes = tableFeeds
        self.addChildViewController(vc)
        vc.view.frame = CGRect(x: 0.0, y: 0.0, width: stackVew.frame.size.width, height: SCREEN_HEIGHT)
        stackVew.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        stackVew.translatesAutoresizingMaskIntoConstraints = false
       // htConst.constant = SCREEN_HEIGHT
    }
    
    func setPhotos(_ tableFeeds : [TimelineModel]) {
        let vc : ProfilePhotoVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ProfilePhotoVC") as! ProfilePhotoVC
        vc.timelineRes = tableFeeds
        self.addChildViewController(vc)
        vc.view.frame = CGRect(x: 0.0, y: 0.0, width: stackVew.frame.size.width, height: SCREEN_HEIGHT)
        stackVew.addSubview(vc.view)
        vc.didMove(toParentViewController: self)
        stackVew.translatesAutoresizingMaskIntoConstraints = false
       // htConst.constant = SCREEN_HEIGHT
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
            FollowingAction_lbl.text = "Following\(userInfo.following_count ?? 0 )"
            lblFollowers.text = "Followers\(userInfo.followers_count ?? 0 )"
            lblPosts.text  = "Posts\(userInfo.post_count ?? 0 )"
        }
    }
}

extension ProfileDetailsVC : UITableViewDelegate,UITableViewDataSource {
    
    var tableViewHeight: CGFloat {
        tableFeeds.layoutIfNeeded()
        
        return tableFeeds.contentSize.height
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex == 2 {
            return timelineRes.count
        }
         if selectedIndex == 1 {
            return photoRes.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedIndex == 2 {
            if timelineRes[indexPath.row].activity == "photo" {
                let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
                cell.populate(timelineRes[indexPath.row])
             
                return cell
            }
            else if timelineRes[indexPath.row].activity == "album" {
                let cell : ProfileWITVC = tableView.dequeueReusableCell(withIdentifier: "ProfileWITVC", for: indexPath) as! ProfileWITVC
                cell.populate(timelineRes[indexPath.row])
           
                return cell
            }
//            else {
//               let cell : ProfileWITVC = tableView.dequeueReusableCell(withIdentifier: "ProfileWITVC", for: indexPath) as! ProfileWITVC
//
//                cell.populate(timelineRes[indexPath.row])
//
//                return cell
//            }
        }
        if selectedIndex == 1 {
            let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
          cell.populate(photoRes[indexPath.row])

            return cell
        }
        else {
            let cell : ProfileTVC = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
          return cell

        }
  }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if selectedPhotoIndex == 2 {
            let desVC : ClickLargeImgVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ClickLargeImgVC1") as! ClickLargeImgVC
            desVC.obj = photoRes[indexPath.row]
            
            self.navigationController?.pushViewController(desVC, animated: true)
        }
        
    }
}

extension ProfileDetailsVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionViewHeight: CGFloat {
        collectionFeeds.layoutIfNeeded()
        
        return collectionFeeds.contentSize.height
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedPhotoIndex == 3 {
            return timelineRes.count
        }
        return photoRes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if selectedPhotoIndex == 1 {
            let cell : Album = collectionView.dequeueReusableCell(withReuseIdentifier: "Album", for: indexPath) as! Album
            cell.populate(photoRes[indexPath.row])
           
            return cell
        }
        else if selectedPhotoIndex == 3 {
            let cell : AlbumTitle = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumTitle", for: indexPath) as! AlbumTitle
            cell.populate(timelineRes[indexPath.row])
            
            return cell
        }
        else {
            let cell : AlbumTitle = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumTitle", for: indexPath) as! AlbumTitle
           
            cell.populate(photoRes[indexPath.row])
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let cells = floor(collectionView.frame.width/80) - 10
        let wd = (collectionView.frame.width-20)/3
        return CGSize(width: wd, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      if selectedPhotoIndex == 1 {
        let desVC : ClickLargeImgVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ClickLargeImgVC1") as! ClickLargeImgVC
        desVC.obj = photoRes[indexPath.row]
        
        self.navigationController?.pushViewController(desVC, animated: true)
        }
        else if selectedPhotoIndex == 3 {
        
        let desVC : ClickLargeImgVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ClickLargeImgVC1") as! ClickLargeImgVC
        desVC.obj1 = timelineRes[indexPath.row]
        self.navigationController?.pushViewController(desVC, animated: true)
      }else if selectedPhotoIndex == 4{
        let desVC1 : LargeClickAlbumVC = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "LargeClickAlbumVC") as! LargeClickAlbumVC
        desVC1.obj = photoRes[indexPath.row]
        self.navigationController?.pushViewController(desVC1, animated: true)
        }
     
    
    }
}

