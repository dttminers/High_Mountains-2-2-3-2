//
//  cardview3.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable class cardview3: UIView {
    
    @IBInspectable var cornerrad:CGFloat=20
    @IBInspectable var shadofwidth:CGFloat=0
    @IBInspectable var shadowofheight:CGFloat=3
    @IBInspectable var shadwocolor:UIColor=UIColor.black
    @IBInspectable var shadowofopactiy:CGFloat=0.50
    @IBInspectable var borderwidth:CGFloat = 2.0
    //@IBInspectable var boardercolor:UIColor=UIColor.black
    
    override func layoutSubviews() {
        
        layer.cornerRadius=cornerrad
        
        layer.shadowColor=shadwocolor.cgColor
        layer.shadowOffset=CGSize(width:shadofwidth, height: shadowofheight)
        let shadowpath=UIBezierPath(roundedRect: bounds, cornerRadius: cornerrad)
        layer.shadowPath=shadowpath.cgPath
        layer.shadowOpacity=Float(shadowofopactiy)
        layer.borderWidth = borderwidth
        //layer.borderColor = boardercolor.cgColor
    }
}

