//
//  PopMenuViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 23/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PopMenuViewController: UIViewController,UITextFieldDelegate  {
    
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
        
        
        
        //add icon
        let Liveimg = UIImage(named: "location_red")
        image.LeftImageTo(txtField: LiveInTxt, andImage: Liveimg!)
        
        let Fromimg = UIImage(named: "from_icon")
        image.LeftImageTo(txtField: Fromtxt, andImage: Fromimg!)
        
        let RelationShipimg = UIImage(named: "location_red")
        image.LeftImageTo(txtField: RelationShipTxt, andImage: RelationShipimg!)
        
        let Favourteimg = UIImage(named: "fav_quote_icon")
        image.LeftImageTo(txtField: FavouriteTravelTxt, andImage: Favourteimg!)
        
        let Bioimg = UIImage(named: "bio_icon")
        image.LeftImageTo(txtField: BioTxt, andImage: Bioimg!)
        
        let Dobimg = UIImage(named: "dob_icon")
        image.LeftImageTo(txtField: DobTxt, andImage: Dobimg!)
        
        
    }

    
    @IBAction func Cancelpopupbtn(_ sender: Any) {
        
        self.view.removeFromSuperview()
        
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
            
    let postparam="lives_in=\(LiveInTxt.text!)&&from=\(Fromtxt.text!)&&gender=\(GenderLbl.text!)&&rel_status=\(RelationShipTxt.text!)&&dob=\(DobTxt.text!)&&fav_quote=\(FavouriteTravelTxt.text!)&&bio=\(BioTxt.text!)&&action=user_info_update&&id=20";
            
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

}
