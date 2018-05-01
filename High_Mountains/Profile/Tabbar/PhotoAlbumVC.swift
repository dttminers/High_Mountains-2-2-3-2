//
//  PhotoAlbumVC.swift
//  High_Mountains
//
//  Created by Abhishek on 23/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import Photos


class PhotoAlbumVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
   
    @IBOutlet var net: UIButton!
    

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var SelectImage: UIImageView!
    @IBOutlet weak var Collectionview: UICollectionView!
    var imageArray = [UIImage]()
    var selectedAssesta = [PHAsset]()
    //var selected : Bool = true
    var selectedIndex: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        grabphotos()
       
    }
  
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.SelectImage
    }
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! PhotoAlbumCVC
        let imageView = cell.viewWithTag(1)as! UIImageView
        imageView.image = imageArray[indexPath.row]
        
        if selectedIndex.contains(indexPath.row){
           cell.SelectedView.isHidden=false
        }else{
            cell.SelectedView.isHidden=true
        }
        
        return cell
    }
    
    
    var selected : Bool?
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width/3-1
        
        return CGSize(width: width ,height: width)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imageView = SelectImage.viewWithTag(0)as! UIImageView
        imageView.image = imageArray[indexPath.row]
        
        if self.selectedIndex.contains(indexPath.row) {
            
            
            self.selectedIndex.remove(at: self.selectedIndex.index(of: indexPath.row)!)
            
        }else{
        
            self.selectedIndex.append(indexPath.row)
            
        }
        self.Collectionview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestinationVC : Share_PostsVC = segue.destination as! Share_PostsVC
        DestinationVC.postimg = SelectImage.image!
        
    }
    
    @IBAction func btnNext(_ sender: Any) {
       
        let controller: MultipleSelectedVC = STORY_BOARD.instantiateViewController(withIdentifier: "Multiplepost") as! MultipleSelectedVC
        controller.Display_img = SelectImage
        for i in 0..<self.imageArray.count{
           
             controller.selectedIndex.append(i)
            print(i)

        }


        self.showDetailViewController(controller, sender: nil)

        
    }
    
    @IBAction func btnBackIcon(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        //let controller = STORY_BOARD.instantiateViewController(withIdentifier: "Posts")
        //self.show(controller, sender: nil)
    }
    
    
    func grabphotos(){
        
        
        let imgManager = PHImageManager.default()
        
        let requestoption = PHImageRequestOptions()
        requestoption.isSynchronous = true
        requestoption.deliveryMode = .highQualityFormat
        
        let fetchoption = PHFetchOptions()
        fetchoption.sortDescriptors = [NSSortDescriptor(key: "creationDate",ascending: false)]
        
        if let fetchResults : PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchoption){
            
            if fetchResults.count>0 {
                for i in 0..<fetchResults.count{
                    imgManager.requestImage(for: fetchResults.object(at: i)  , targetSize: CGSize(width: 200 , height: 200), contentMode: .aspectFill, options: requestoption, resultHandler: { (image, error) in
                        
                        self.imageArray.append(image!)
                        
                        
                    })
                }
            }
            
        }
        else{
            print("you got no photo")
            self.Collectionview.reloadData()
            
        }
        
        
    }

}
