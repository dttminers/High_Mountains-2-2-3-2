//
//  friendrequestViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 09/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class friendrequestViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate {
    
    var image = [ UIImage(named:"download"),UIImage(named:"download"),UIImage(named:"download"),UIImage(named:"download")]
    var name = [ "abhi" ,"raj","raj","raj"]
    var frimage = [ UIImage(named:"download"),UIImage(named:"download")]
    var frname = ["abhi","Dipti Mallik"]
    //var comment = [""]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendRequestCollectionViewCell", for: indexPath)as!FriendRequestCollectionViewCell
        cell.friendRequestimg.image = image[indexPath.row]
       cell.friendrequestlbl.text = name[indexPath.row]
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frimage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "frcell", for: indexPath)as!friendRquestTableViewCell
        cell.frndReqlbl.text = frname[indexPath.row]
        cell.fReqimg.image = frimage[indexPath.row]
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
    
    @IBAction func fReqstConfirm(_ sender: Any) {
        
    }
    
    @IBAction func fReqstIgnore(_ sender: Any) {
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
