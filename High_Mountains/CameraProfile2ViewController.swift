//
//  CameraProfile2ViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip

struct profile: Decodable{
    
    let usrename: String
    let image_url: String
    let like_count: String
    let comment_count: String
    let share_count: String
}

class CameraProfile2ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   var CProfile = [profile]()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
 self.downloadJsonWithURL()
        
        // Do any additional setup after loading the view.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Camera2", for: indexPath)as!CameraProfile2TableViewCell
        cell.profilenamelbl.text = CProfile[indexPath.row].usrename.capitalized
        let Defaultlink = "http://vnoi.in/hmapi/"
        let Compeletelink = Defaultlink + CProfile[indexPath.row].image_url
        cell.uploadimg.downloadedFrom(link: Compeletelink)
        cell.likeslbl.text = CProfile[indexPath.row].like_count
        cell.commentlbl.text = CProfile[indexPath.row].comment_count
        cell.sharelbl.text = CProfile[indexPath.row].share_count
        return cell
    }
    
    
    func downloadJsonWithURL() {
        let myUrl = URL(string: "http://vnoi.in/hmapi/feed.php");
        
        print(myUrl!)
        var request = URLRequest(url: myUrl! )
        
        request.httpMethod = "post"
        
        let postString = "action=fetch_photos&&uid=20";
        
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil
            {
                do{
                    self.CProfile = try JSONDecoder().decode([profile].self, from: data!)
                }catch {
                    print("error")
                }
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
            else if response != nil{
                
                
                print("response = \(String(describing: response))")
                
                
                
            }
            
            
        };task.resume()
        
}
}


extension CameraProfile2ViewController : IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "one")
}
}
