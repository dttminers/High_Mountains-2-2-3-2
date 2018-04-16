//
//  AllreadyReggisterViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 05/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class AllreadyReggisterViewController: UIViewController {

    @IBOutlet weak var circularimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       circularimg.roundimage()
        
       /* circularimg.layer.borderWidth = 3
        circularimg.layer.borderColor = UIColor.white.cgColor
        circularimg.perform(@#imageLiteral(resourceName: "IMG-20180224-WA0015"), 0, with: AnyObject)*/
    }

   
    
    @IBAction func SignInBtn(_ sender: Any) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "Menu")
    self.present(controller, animated: true, completion: nil)
    

}
}
