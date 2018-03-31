//
//  PlanTripViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 12/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PlanTripViewController: UIViewController {

    @IBOutlet weak var Fromtxt: singup!
    @IBOutlet weak var Wheretxt: singup!
    @IBOutlet weak var Startdatetxt: singup!
    @IBOutlet weak var Enddatetxt: singup!
    @IBOutlet weak var Numberoftravelertxt: singup!
    @IBOutlet weak var Totalnoofroomstxt: singup!
    @IBOutlet weak var Budgettxt: singup!
    @IBOutlet weak var PointTobeKeptInMindtxt: singup!
    
    @IBOutlet weak var TransportPrefered: singup!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let Usernameimg = UIImage(named:"user1")
        addLeftImageTo(txtField: Fromtxt, andImage: Usernameimg!)
        
        /* let passwordImage = UIImage(named:"pass1")
         addLeftImageTo(txtField: Password, andImage: passwordImage!)*/
        
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 40))
        view.addSubview(leftImageView)
        txtField.leftView = view
        txtField.leftViewMode = .always
    }

}
