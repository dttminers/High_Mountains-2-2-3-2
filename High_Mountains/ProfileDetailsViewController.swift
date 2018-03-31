//
//  ProfileDetailsViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class ProfileDetailsViewController: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var UserNamelbl: UILabel!
    //indroduction yourself
    @IBOutlet weak var Profileimg: UIImageView!
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
       //  self.loadDesign()
        
        super.viewDidLoad()
        
    
       self.downloadJsonWithURL()
       // ScrollView.contentSize.height = 1000
        
        
        
    }
    
    //pop button action
    @IBAction func PopUpActbtn(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Popup") as! PopMenuViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
    
    
    
  func downloadJsonWithURL() {
    if (currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN){
        let myUrl = URL(string: "http://vnoi.in/hmapi/register_login.php");
        
        print(myUrl!)
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "post"
        let postString="action=user_info_display&&uid=20";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
       
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil
            {
                print("error=\(String(describing: error))")
                return
            }
            else if response != nil{
                
                
                print("response = \(String(describing: response))")
                
                
                do
                {
                    
                    /* let json = try JSONSerialization.jsonObject(with: data!, options: [.allowFragments])
                     
                     print(json)*/
                    
                    let myJson = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    print(myJson)
                    
                    if let name = myJson["lives_in"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.LiveInlbl.text = name
                        }
                    }
                    
                    if let name = myJson["from_des"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.Fromlbl.text = name
                        }
                    }
                    
                    if let name = myJson["relationship_status"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.RelationStatuslbl.text = name
                        }
                    }
                    
                    if let name = myJson["dob"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.Doblbl.text = name
                        }
                    }
                    
                    if let name = myJson["dob"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.Doblbl.text = name
                        }
                    }
                    
                    if let name = myJson["fav_quote"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.FavTravlQuoteslbl.text = name
                        }
                    }
                    
                    if let name = myJson["username"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.UserNamelbl.text = name
                        }
                    }
                    
                    if let name = myJson["bio"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.Biolbl.text = name
                        }
                    }
                    
                    if let name = myJson["gender"]as? String{
                        print(name)
                        DispatchQueue.main.async {
                            self.Genderlbl.text = name
                        }
                    }
                    
                    if let name = myJson["profile_pic"]as? String{
                        print(name)
                        let img = "http://vnoi.in/hmapi/"
                        let Completeimg = img + "\(name)"
                        print(Completeimg)
                        DispatchQueue.main.async {
                            self.Profileimg.downloadedFrom(link: Completeimg)
                        }
                    }
                
                }catch{
                    print(error)
                }
            }
            
        };task.resume()
        
      
        
        print("User is connected to the internet via wifi.")
    }else {
        print("There is no internet connection")
    }
    
        
        
    }
    
    
    
override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    let child = UIStoryboard(name: "Main" , bundle:nil).instantiateViewController(withIdentifier: "camera")
    return [child]

    }

    func loadDesign()
    {
        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = UIColor.black
        self.settings.style.buttonBarBackgroundColor = .black
        self.settings.style.buttonBarItemBackgroundColor = UIColor.black
        self.settings.style.selectedBarBackgroundColor = .white
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 4.0
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = .black
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 100
        self.settings.style.buttonBarRightContentInset = 100
        self.settings.style.buttonBarMinimumInteritemSpacing = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
        guard changeCurrentIndex == true else { return }
        
        oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
        newCell?.label.textColor = .white
        }
    
    
}
}

