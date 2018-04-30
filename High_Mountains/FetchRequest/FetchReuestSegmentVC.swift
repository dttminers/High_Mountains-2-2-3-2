//
//  FetchReuestSegmentVC.swift
//  High_Mountains
//
//  Created by Abhishek on 25/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FetchReuestSegmentVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segment(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            print("hiii")
            break
        case 1:
            let controller = STORY_BOARD.instantiateViewController(withIdentifier: "FetchSegment")
            self.navigationController?.show(controller, sender: nil)
            break
        default:
            break
        }
        
    }
        
    }
    
    


