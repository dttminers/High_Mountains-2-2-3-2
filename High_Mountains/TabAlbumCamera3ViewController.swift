//
//  TabAlbumCamera3ViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class TabAlbumCamera3ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TabAlbum3", for: indexPath)
        return cell
    }
    

}
extension TabAlbumCamera3ViewController : IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "FTab")
    }
    }


