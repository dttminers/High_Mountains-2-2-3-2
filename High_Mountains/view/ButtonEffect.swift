//
//  ButtonEffect.swift
//  High_Mountains
//
//  Created by Abhishek on 12/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation
import UIKit

class button : UIButton
{
    
 
    override func draw(_ rect: CGRect) {
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
       self.layer.shadowColor = UIColor.black.cgColor
     self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1.0
    }
    
}



