//
//  ProfileDetailsViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit



class ProfileDetailsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //bar iteam
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var note: UIButton!
    
    //
    @IBOutlet weak var ProfileIMG: UIImageView!
    @IBOutlet weak var segment1: UISegmentedControl!
    
    
    @IBOutlet weak var FollowingAction_lbl: UILabel!
    
    
    
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
    
  
    var selectedIndex: Int = 0
      var viewControllers: [UIViewController]!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.downloadJsonWithURL()
        //  self.loadDesign()
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProfileDetailsViewController.ImageTapped(_:)))
        ProfileIMG.addGestureRecognizer(tapGesture)
        ProfileIMG.isUserInteractionEnabled = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileDetailsViewController.Following(_:)))
       FollowingAction_lbl.addGestureRecognizer(tap)
     FollowingAction_lbl.isUserInteractionEnabled = true
       
        }
    
   
    @objc func Following(_ sender: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Following")
        self.present(controller, animated: true, completion: nil)
    }
   
    @IBAction func AaractionBTN(_ sender: Any) {
        if red.isHidden {
            view2.isHidden = false
        } else if(camera.isHidden) {
            view2.isHidden = true
        }
        else {
            note.isHidden = false
            view2.isHidden = false
        }
       
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
                    
