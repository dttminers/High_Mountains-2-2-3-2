//
//  singup.swift
//  High_Mountains
//
//  Created by Abhishek on 05/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
//@IBDesignable
class singup: UITextField {
    
 /*  @IBInspectable var leftimage: UIImage?{
        didSet {
            
            updateview()
        }
        
    }
    
@IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateview()
        }
        
    }*/

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        styleTextField()
    }
    
    private func styleTextField() {
        let neon = UIColor(displayP3Red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
        let border = CALayer()
        let width = CGFloat(2.0)
        
        border.borderColor = neon.cgColor
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: bounds.size.height - width, width: bounds.size.width, height: bounds.size.height)
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }




/*func updateview(){
    
    if let image = leftimage {
        leftViewMode = .always
        
        let imageview = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
       imageview.image = image
        
        var width = leftPadding + 20
        
        if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line{
            width = width + 5
        }
        
        let view = UIView(frame:CGRect(x: 0, y: 0, width: width, height: 20))
        view.addSubview(imageview)
        leftView = view
        //leftimage = image
      
    } else{
        
        leftViewMode = .never
    }
    
}*/
}
