//
//  SearchVC.swift
//  High_Mountains
//
//  Created by Abhishek on 09/05/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.showView((self.navigationController?.navigationBar)!, navigationItem: navigationItem, navigationController: self.navigationController!, isBack: 2,  lblheading: "High Mountain")
    }
    
    
}
