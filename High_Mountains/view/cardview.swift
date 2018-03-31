//
//  cardview.swift
//  card
//
//  Created by Abhishek on 23/02/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

@IBDesignable class cardview: UIView {

    @IBInspectable var cornerrad:CGFloat=2
    @IBInspectable var shadofwidth:CGFloat=0
    @IBInspectable var shadowofheight:CGFloat=5
    @IBInspectable var shadwocolor:UIColor=UIColor.black
    @IBInspectable var shadowofopactiy:CGFloat=1
    
    
    override func layoutSubviews() {
        
    layer.cornerRadius=cornerrad
        
    layer.shadowColor=shadwocolor.cgColor
        layer.shadowOffset=CGSize(width:shadofwidth, height: shadowofheight)
        let shadowpath=UIBezierPath(roundedRect: bounds, cornerRadius: cornerrad)
        layer.shadowPath=shadowpath.cgPath
        layer.shadowOpacity=Float(shadowofopactiy)
    }
}
