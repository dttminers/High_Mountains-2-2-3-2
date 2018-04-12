//
//  LeftImage.swift
//  High_Mountains
//
//  Created by Abhishek on 01/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation
class image{
    
  class  func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 25.0))
        leftImageView.image = img
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 19))
        view.addSubview(leftImageView)
        txtField.leftView = view
        txtField.leftViewMode = .always
}
    
    class  func rightImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 120.0, y: 0.0, width: 20.0, height: 25.0))
        leftImageView.image = img
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        view.addSubview(leftImageView)
        txtField.leftView = view
        txtField.leftViewMode = .always
    }
    
}



