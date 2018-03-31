//
//  round image.swift
//  High_Mountains
//
//  Created by Abhishek on 06/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//


import UIKit

extension UIImageView
{
    func roundimage(){
        
        self.layer.cornerRadius = self.bounds.width/2
         self.clipsToBounds = true
        self.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 0.90).cgColor
        self.layer.borderWidth = 2
        self.isHidden = false
        
    }
    
    
}

