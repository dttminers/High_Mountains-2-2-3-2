//
//  circle.swift
//  High_Mountains
//
//  Created by Abhishek on 06/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class circle: UIView {
    
    //var line = UIBezierPath()
    var muliplier:CGFloat = 0.85
    
    var centerofcircle:CGPoint{
        return CGPoint(x:bounds.midX, y:bounds.midY)
    }
    var halfofviewsize:CGFloat{
        return min(bounds.size.height, bounds.size.width)/2*muliplier
    }
    
    var linewidth: CGFloat = 0.9
    
    // circle radius
    
    var full = CGFloat(Double.pi*2)
    var quarter = CGFloat(Double.pi/2)
    var half = CGFloat(Double.pi)
    var threequarter = CGFloat(3*Double.pi/2)
    
    func drawcircleCenteredAt(_:CGPoint,withRadius radius:CGFloat) -> UIBezierPath{
        
        let circlepath = UIBezierPath(arcCenter:centerofcircle, radius: halfofviewsize, startAngle: 00, endAngle: full, clockwise: true)
        circlepath.lineWidth = linewidth
        return circlepath
        
    }
    
   /* func graph()
    {
        /*line.move(to: .init(x: 0, y: bounds.height/2))
        line.addLine(to: .init(x: bounds.width, y: bounds.height))
        UIColor.black.setStroke()
        line.lineWidth = 2
        line.stroke()*/
        
       // let whiteline = bounds.height/2
        line.move(to: .init(x: 20, y: 20))
        //line.addLine(to: .init(x: 180, y: whiteline-0))
         line.addLine(to: .init(x: bounds.width, y: bounds.height))
        line.lineWidth = 2
        line.stroke()
    }
    */
    override func draw(_ rect: CGRect) {
        //graph()
        UIColor.white.set()
        drawcircleCenteredAt(centerofcircle, withRadius: halfofviewsize).stroke()
        
        
    }
    
  
    
}
