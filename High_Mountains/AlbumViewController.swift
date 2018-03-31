//
//  AlbumViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip





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

   //final let myUrl = "http://vnoi.in/hmapi/feed.php"

    
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
                    self.photo = try JSONDecoder().decode([FetchPhoto].self, from: data!)
                }catch {
                    print("error")
                }
                
                DispatchQueue.main.async {
                    self.collectionview.reloadData()
                }
            }
                
            else if response != nil{
                
                print("response = \(String(describing: response))")

            }
            
            
        };task.resume()
        
        
    
    
   
    
    /*func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5
        
        let numberofitemperrow:CGFloat = 2.0
        let itemawidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberofitemperrow
        
        return CGSize(width: itemawidth, height: itemawidth)
    }*/

}

/*extension AlbumViewController : IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "sab")
}
}*/
}
