//
//  PopMenuViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 23/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PopMenuViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate   {
    
    @IBOutlet weak var Profileimg: UIImageView!
    @IBOutlet weak var LiveInTxt: HoshiTextField!
    @IBOutlet weak var Fromtxt: HoshiTextField!
    @IBOutlet weak var RelationShipTxt: HoshiTextField!
    @IBOutlet weak var FavouriteTravelTxt: HoshiTextField!
    @IBOutlet weak var BioTxt: HoshiTextField!
    @IBOutlet weak var DobTxt: HoshiTextField!
    
    //Gender
    @IBOutlet weak var GenderLbl: UILabel!
    
    
    @IBAction func GenderBtn(_ sender: Any) {
        
        let alret = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let Male = UIAlertAction(title: "Male", style: .default, handler: {(ACTION) in self.GenderLbl.text = "Male"})
        let Female = UIAlertAction(title: "Female", style: .default, handler: {(ACTION) in self.GenderLbl.text = "Female"})
        let Others = UIAlertAction(title: "Other", style: .default, handler: {(ACTION) in self.GenderLbl.text = "Other"})
        alret.addAction(Male)
        alret.addAction(Female)
        alret.addAction(Others)
        self.present(alret, animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.Dropdownlisttxt {
            
            textField.endEditing(true)
        }
        
    }
    @IBOutlet weak var Dropdownlisttxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        // self.removeAnimate()
        
        AppUtility.setCornerRadius(Profileimg, radius: 50)
        self.userInfoDisplay()
        
    }
    
    
    @IBAction func Cancelpopupbtn(_ sender: Any) {
        self.dismiss(animated: false) {
            
            let controller = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ProfileDetails")
            self.show(controller, sender: nil)
        }
        
    }
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
        
        
        
    }
    
    @IBAction func SaveButtonBtn(_ sender: Any) {
        
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let postparam="lives_in=\(LiveInTxt.text!)&&from=\(Fromtxt.text!)&&gender=\(GenderLbl.text!)&&rel_status=\(RelationShipTxt.text!)&&dob=\(DobTxt.text!)&&fav_quote=\(FavouriteTravelTxt.text!)&&bio=\(BioTxt.text!)&&action=user_info_update&&id=\(userId)";
            
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
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
                            if (res["msg"]as? String) != nil{
                                
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
    
    @IBAction func btnChangephoto(_ sender: Any) {
        
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
            
            Profileimg.contentMode = .scaleToFill
            Profileimg.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func userInfoDisplay() {
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            let postparam="action=user_info_display&&uid=\(userId)";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)register_login.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    if let liveIn = res["lives_in"] as? String{
                       
                        self.LiveInTxt.text = liveIn
                        
                    }
                    if let From = res["from_des"] as? String{
                        
                        self.Fromtxt.text = From
                        
                    }
                     if let Gender = res["gender"] as? String{
                        
                        self.GenderLbl.text = Gender
                        
                    }
                   if let Relationship = res["relationship_status"] as? String{
                        
                        self.RelationShipTxt.text = Relationship
                        
                    }
                     if let Dob = res["dob"] as? String{
                        
                        self.DobTxt.text = Dob
                        
                    }
                     if let fav_quote = res["fav_quote"] as? String{
                        
                        self.FavouriteTravelTxt.text = fav_quote
                        
                    }
                   if let Bio = res["bio"] as? String{
                        
                        self.BioTxt.text = Bio
                        
                    }
                    if let ProfileImg = res["profile_pic"] as? String{
                        
                        self.Profileimg.loadImageUsingCache(withUrl: "\(url)\(ProfileImg)")
                        
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
