//
//  All_DestinationVC.swift
//  High_Mountains
//
//  Created by Abhishek on 11/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class All_DestinationVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
   
    @IBOutlet weak var tableviewD: UITableView!
    @IBOutlet weak var btnDropDown: DropMenuButton!
    var Destination : [AllDestination] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()

       btnDropDown.initMenu(["London", "France", "Paris"], actions: [({ () -> (Void) in
            print("London")
        }), ({ () -> (Void) in
            print("France")
        }), ({ () -> (Void) in
            print("Paris")
        })])
        
        
        tableviewD.register(UINib(nibName : "All_DestinationTVC", bundle:nil), forCellReuseIdentifier: "All_DestinationTVC")
        self.URLDownload()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Destination.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : All_DestinationTVC = tableView.dequeueReusableCell(withIdentifier: "All_DestinationTVC", for: indexPath) as! All_DestinationTVC
        cell.populateData(Destination[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func URLDownload()
    {
        let postparam = "action=destination&&uid=\(userId)";
        APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)destination.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
            if status {
                let dt = JSON(data : result as! Data)
                let res : [AnyObject] = dt.object as! [AnyObject]
                print(res)
                
                self.Destination = DATA_MANAGER.setDestinationDictionary(res)
                self.tableviewD.reloadData()
            }
            else {
                self.alertDialog(msg: result as! String)
            }
        })
    }
    
    }


    

