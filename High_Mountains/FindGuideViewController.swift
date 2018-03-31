//
//  FindGuideViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 14/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class FindGuideViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var FindGuidetablevw: UITableView!
    //table view
    var Longimg = [UIImage(named:"download")]
    var Longname = ["abhi"]
    var Longplace = ["Dubai"]
    //var Longtime = ["10.30"]
    
    
    // collectionview
    var findimg = [UIImage(named:"slide")]
     var findlbl = ["abhi"]
    var findtime = ["10.30"]
    var findplace = ["Dubai"]
    
    
    // collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return findimg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindCell", for: indexPath)
        as!FindGuideCollectionViewCell
        cell.FindGuideimg.image = findimg[indexPath.row]
        cell.FindGuidelbl.text = findplace[indexPath.row]
        cell.FindGuideTimelbl.text = findtime[indexPath.row]
         cell.FindGuidePlacelbl.text = findplace[indexPath.row]
        return cell
    }
    
    
    
    //tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Longimg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FindGiudeCell", for: indexPath) as!FindGuideTableViewCell
        cell.FindGuideimg.image = Longimg[indexPath.row]
        cell.FindGuideNamelbl.text = Longname[indexPath.row]
        cell.FindGuidePricelbl.text = Longplace[indexPath.row]
        
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
    

    
}
