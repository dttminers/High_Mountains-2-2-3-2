//
//  DropDownFavDestionViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 15/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class DropDownFavDestionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate{
    
    @IBOutlet weak var Scrollbar: UIScrollView!
    
    @IBOutlet weak var tableview2: UITableView!
    @IBOutlet weak var tableview1: UITableView!
    // collection view place to visit

    var Placeimg = [UIImage(named:"download")]
    var Placelbl = ["Alibag"]
    
    @IBOutlet weak var CollectView1: UICollectionView!
    
    //collection view Featured packages
    
    var Featuredimg = [UIImage(named:"download")]
    var FeaturedPacklbl = ["Alibag"]
    var FeaturedPrices = ["$ 50"]
    
    @IBOutlet weak var CollectionView2: UICollectionView!
    
    
    //table view 1
    var image1 = [UIImage(named: "download")]
    var Titlename = ["France"]
    var Description = ["Its a Awsome place"]
    var TourNo = ["20"]
    var ActivitiesNo = ["30"]
    var renotoutsNo = ["40"]
    var TourNam = ["Tours"]
    var ActivitesName = ["Activites"]
    var RentoutsName = ["Rentouts"]
    
    
    //table view 2
    var otherpackimg = [UIImage(named:"download")]
    var otherPackName = ["Ali"]
    var OtherPackprices = ["$ 30"]
    
    
    // table view
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == tableview1){
        return image1.count
        }else{
            return otherpackimg.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == tableview1){
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Dropfavcell", for: indexPath)as!DropDownFavDestinationTableViewCell
        cell.ImgDrpDwnfav.image = image1[indexPath.row]
        cell.Activiteslbl.text = ActivitesName[indexPath.row]
        cell.Rentoutslbl.text = RentoutsName[indexPath.row]
        cell.tourslbl.text = TourNam[indexPath.row]
        cell.RentoutsNolbl.text = renotoutsNo[indexPath.row]
        cell.ActivitiesNolbl.text = ActivitiesNo[indexPath.row]
        cell.TourNolbl.text = TourNo[indexPath.row]
        cell.Descriptionlbl.text = Description[indexPath.row]
        cell.DropDestionNamelbl.text = Titlename[indexPath.row]
        return cell
        
        }else{
            
             let cell = tableView.dequeueReusableCell(withIdentifier: "DpDnotherPackCell", for: indexPath)as!DropDownFavDestinationTableViewCell
            
            cell.otherFeatureimg.image = otherpackimg[indexPath.row]
            cell.Otherpacknamelbl.text = otherPackName[indexPath.row]
            cell.otherpackpricelbl.text = OtherPackprices[indexPath.row]
            return cell
            
        }
    }
    // collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CollectView1){
        return Placeimg.count
        }else{
            
            return Featuredimg.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == CollectView1){
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceToVisitcell", for: indexPath)as!DropDwnFavDestCollectionViewCell
        
        cell.PlacoToVisitimg.image = Placeimg[indexPath.row]
        cell.PlaceToVisitlbl.text = Placelbl[indexPath.row]
        return cell
        }
        else{
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FetaurePackcell", for: indexPath)as!DropDwnFavDestCollectionViewCell
            cell.FeaturedPackimg.image = Featuredimg[indexPath.row]
            cell.FeaturedPackedlbl.text = FeaturedPacklbl[indexPath.row]
            cell.Featuredpriceslbl.text = FeaturedPrices[indexPath.row]
            return cell
            
        }
        
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
Scrollbar.contentSize.height = 1000
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
