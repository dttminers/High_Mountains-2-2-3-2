//
//  NotificationViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 10/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    var Notimg = [UIImage(named: "download")]
    var Notinamelbl = ["abhi"]
    var Notitour = ["Rajeshthan tour's"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Notimg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Noticell", for: indexPath)as!NotificationTableViewCell
        cell.Notificationimg.image = Notimg[indexPath.row]
        cell.Notificationlbl.text = Notinamelbl[indexPath.row]
        cell.NotTourlbl.text = Notitour[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
