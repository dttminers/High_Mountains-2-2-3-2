//
//  profiletvViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 08/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

/*class profiletvViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    let pname = ["Ria Singh"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pname.count
    }
    
   /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell")as!profileTableViewCell
        cell.profilenamelbl.text = pname[indexPath.row]
        //cell.profileimg.image = UIImage(named: <#T##String#>)
       // retuen cell
    }*/
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}*/
