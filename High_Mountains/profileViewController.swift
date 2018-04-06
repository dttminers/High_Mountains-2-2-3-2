//
//  profileViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 09/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       self.profileImg.layer.cornerRadius = self.profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
      //  self.profileImg.layer.borderWidth = 3.0
       
        
        
        
    }

    @IBAction func ViewProfile_Btn(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ProfileDetails")
        self.present(controller, animated: true, completion: nil)
        
           }
    

}
