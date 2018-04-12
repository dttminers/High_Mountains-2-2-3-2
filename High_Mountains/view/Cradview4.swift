//
//  Cradview4.swift
//  High_Mountains
//
//  Created by Abhishek on 12/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation


@IBDesignable class cardview4: UIView {
@IBInspectable var cornerrad:CGFloat=20
    override func layoutSubviews() {
        
        layer.cornerRadius=cornerrad
      
}
}
