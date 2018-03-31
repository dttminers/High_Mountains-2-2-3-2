//
//  textfieldEffect.swift
//  High_Mountains
//
//  Created by Abhishek on 12/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation
import UIKit

class TextEff: UITextField {
    
    override func draw(_ rect: CGRect) {
    style()
    }
   
   func style(){
    
        self.layer.borderColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1).cgColor
        self.layer.borderWidth = CGFloat(Float(1.0))
    
    }
    
}

