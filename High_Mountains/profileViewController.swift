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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
