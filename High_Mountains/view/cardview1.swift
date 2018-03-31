//
//  cardview1.swift
//  High_Mountains
//
//  Created by Abhishek on 12/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class cardview1: UIView {
    
    @IBInspectable var cornerrad:CGFloat=1
    @IBInspectable var shadofwidth:CGFloat=0
    @IBInspectable var shadowofheight:CGFloat=3
    @IBInspectable var shadwocolor:UIColor=UIColor.black
    @IBInspectable var shadowofopactiy:CGFloat=0.50
    
    
    override func layoutSubviews() {
        
        layer.cornerRadius=cornerrad
        
        layer.shadowColor=shadwocolor.cgColor
        layer.shadowOffset=CGSize(width:shadofwidth, height: shadowofheight)
        let shadowpath=UIBezierPath(roundedRect: bounds, cornerRadius: cornerrad)
        layer.shadowPath=shadowpath.cgPath
        layer.shadowOpacity=Float(shadowofopactiy)
    }
}
