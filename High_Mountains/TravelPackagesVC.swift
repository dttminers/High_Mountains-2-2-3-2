//
//  TravelPackagesVC.swift
//  High_Mountains
//
//  Created by Abhishek on 12/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

struct headStruct {
    
    var name : String!
}
 var headersection: CGFloat = 44

class TravelPackagesVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    var arrayHeader = [headStruct]()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        arrayHeader = [headStruct.init(name: "hi"),headStruct.init(name: "hello"),headStruct.init(name: "hello"),headStruct.init(name: "hello")]
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelCell")
        
        return cell!
        
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        return arrayHeader.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headersection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let TravelPartHeaderTVC = Bundle.main.loadNibNamed("TravelPartHeaderTVC", owner: self, options: nil)?.first as! TravelPartHeaderTVC
        TravelPartHeaderTVC.lblHeader.text = arrayHeader[section].name
        
        return TravelPartHeaderTVC
    }
}

