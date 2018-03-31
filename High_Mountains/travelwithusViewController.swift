//
//  travelwithusViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 09/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class travelwithusViewController: UIViewController,UITableViewDataSource,UICollectionViewDelegate {
    
    var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return categories.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return categories[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! travelwiyhusTableViewCell
      
        return cell
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
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
