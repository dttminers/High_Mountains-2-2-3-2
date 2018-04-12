//
//  PlanTripVC.swift
//  High_Mountains
//
//  Created by Abhishek on 12/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PlanTripVC: UIViewController {

    @IBOutlet weak var FromTxt: HoshiTextField!
    @IBOutlet weak var WhereToTxt: HoshiTextField!
    @IBOutlet weak var StarDateTxt: HoshiTextField!
    @IBOutlet weak var EndDateTxt: HoshiTextField!
    @IBOutlet weak var PointToBeMindTxt: HoshiTextField!
    @IBOutlet weak var NumberOfTravTxt: HoshiTextField!
    @IBOutlet weak var BudgetTxt: HoshiTextField!
    @IBOutlet weak var TotalNumberOfRoomTxt: HoshiTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let From = UIImage(named: "t1")
        image.addLeftImageTo(txtField: FromTxt, andImage: From!)
        
        let Where = UIImage(named: "t2")
        image.addLeftImageTo(txtField: WhereToTxt, andImage: Where!)
        
        let StartDT = UIImage(named: "t3")
        image.rightImageTo(txtField: StarDateTxt, andImage: StartDT!)

        let EndDT = UIImage(named: "t3")
        image.rightImageTo(txtField: EndDateTxt, andImage: EndDT!)
        
        
        let NOOFTV = UIImage(named: "t4")
        image.addLeftImageTo(txtField: NumberOfTravTxt, andImage: NOOFTV!)
        
        
        let TotalNO = UIImage(named: "t3")
        image.addLeftImageTo(txtField: TotalNumberOfRoomTxt, andImage:TotalNO!)
        
        let Budget = UIImage(named: "t3")
        image.addLeftImageTo(txtField:BudgetTxt, andImage: Budget!)
        
        
        let PointTOKeepMind = UIImage(named: "t3")
        image.addLeftImageTo(txtField: PointToBeMindTxt, andImage: PointTOKeepMind!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
