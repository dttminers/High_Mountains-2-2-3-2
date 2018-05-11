//
//  galleryVC.swift
//  High_Mountains
//
//  Created by Abhishek on 10/05/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import Photos
import BSImagePicker

class galleryVC: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    var SelectedAssets = [PHAsset]()
    var PhotoArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
       self.gall()
     
    }

   
    func gall(){
    
    
        // create an instance
        let vc = BSImagePickerViewController()
       
    
        self.bs_presentImagePickerController(vc, animated: false,
                                             select: { (asset: PHAsset) -> Void in
                                                
        }, deselect: { (asset: PHAsset) -> Void in
            // User deselected an assets.
            
        }, cancel: { (assets: [PHAsset]) -> Void in
            // User cancelled. And this where the assets currently selected.
        }, finish: { (assets: [PHAsset]) -> Void in
            // User finished with these assets
            
            for i in 0..<assets.count
            {
                self.SelectedAssets.append(assets[i])
                
            }
            
            self.convertAssetToImages()
            
        }, completion: nil)
        
    }
    
    
    func convertAssetToImages() -> Void {
        
        if SelectedAssets.count != 0{
            
            
            for i in 0..<SelectedAssets.count{
                
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumbnail = UIImage()
                option.isSynchronous = true
                
                
                manager.requestImage(for: SelectedAssets[i], targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options: option, resultHandler: {(result, info)->Void in
                    thumbnail = result!
                    
                })
                
                let data = UIImageJPEGRepresentation(thumbnail, 0.7)
                let newImage = UIImage(data: data!)
                
                
                self.PhotoArray.append(newImage! as UIImage)
                
            }
            
            self.image.animationImages = self.PhotoArray
            self.image.animationDuration = 3.0
            self.image.startAnimating()
            
        }
        
        
        print("complete photo array \(self.PhotoArray)")
    }
    }

