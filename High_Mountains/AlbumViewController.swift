//
//  AlbumViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

struct FetchPhoto: Decodable{

    let image_url: String

}


class AlbumViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var collectionview: UICollectionView!
    
     var photo = [FetchPhoto]()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath)as!AlbumCollectionViewCell
        let DefaultLink = "http://vnoi.in/hmapi/"
        let CompleteLink = DefaultLink + photo[indexPath.row].image_url
        cell.AlbumImg.downloadedFrom(link: CompleteLink)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 self.downloadJsonWithURL()
        
    }

   
    
    func downloadJsonWithURL() {
        
        if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){
            
            let postparam = "action=fetch_albums&&uid=2";
            APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)feed.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                if status {
                    let dt = JSON(data : result as! Data)
                    print(dt)
                    let res : AnyObject = dt.object as AnyObject
                    if let name = res ["image_url"] as? String{
                       print(name)
                        
                    }
                }
                    
                
                else {
                    self.alertDialog(msg: result as! String)
                }
                
            })
            
        }else {
            print("There is no internet connection")
        }
    }
    
    
}
   