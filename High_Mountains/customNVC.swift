//
//  customNVC.swift
//  AdaptiveLearning
//
//  Created by Shivam Dubey on 05/02/18.
//  Copyright © 2018 Shivam Dubey. All rights reserved.
//

import UIKit

class customNVC: UINavigationController{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.backItem?.title = "Anything Else"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backItem?.title = "Anything Else"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    

}

