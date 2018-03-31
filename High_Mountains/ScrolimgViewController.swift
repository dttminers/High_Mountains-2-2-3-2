//
//  ScrolimgViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 13/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class ScrolimgViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    var image: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageview.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
