//
//  PostsVC.swift
//  High_Mountains
//
//  Created by Abhishek on 23/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import Photos
import BSImagePicker

class PostsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout  {
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var largeimg: UIImageView!
    
    @IBOutlet weak var collectionview: UICollectionView!
    
    @IBOutlet weak var VideoDisplayView: UIView!
    @IBOutlet weak var ClickDisplayView: UIView!
    
    @IBOutlet weak var CameraDisplayView: UIView!
    @IBOutlet weak var ContainerGView: UIView!
    
    @IBOutlet weak var ViewTabbar: UIView!
    
    @IBOutlet weak var btnGallery: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnVideo: UILabel!
    
    @IBOutlet weak var VideoView: UIView!
    @IBOutlet weak var CaneraView: UIView!
    @IBOutlet weak var GalleryView: UIView!
    
    var selectedPhotoIndex : Int = 1
    var SelectedAssets = [PHAsset]()
    var PhotoArray = [UIImage]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnActiononTab(btnGallery)
  
        self.scrollview.minimumZoomScale = 1.0
        self.scrollview.maximumZoomScale = 6.0
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.largeimg
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as! PhotoAlbumCVC
        let imageView = cell.viewWithTag(1)as! UIImageView
        imageView.image = PhotoArray[indexPath.row]
        if imageView.image == PhotoArray[0]{
            largeimg.image = imageView.image
        }
        postimg = PhotoArray[indexPath.row]
        cell.index = indexPath
        cell.delegate = self
        
        return cell
    }
    
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
        
        let imageView = largeimg.viewWithTag(0)as! UIImageView
        imageView.image = PhotoArray[indexPath.row]
        
        self.collectionview.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //configureNavView(self, isBack: false)
        
        navigationController?.navigationBar.showView((self.navigationController?.navigationBar)!, navigationItem: navigationItem, navigationController: self.navigationController!, isBack: 5,  lblheading: "Gallery")
        
    }
    
    
    @IBAction func btnActiononTab(_ sender: UIButton) {
        
        selectedPhotoIndex = sender.tag
        if sender.tag == 1 {
            gall()
            GalleryView.alpha = 1
            CaneraView.alpha = 0
            // VideoView.alpha = 0
            ClickDisplayView.alpha = 1
            CameraDisplayView.alpha = 0
            // VideoDisplayView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                
                // self.ContainerGView.alpha = 0
                
            })
            
        }else if sender.tag == 2 {
            CameraNav()
            GalleryView.alpha = 0
            CaneraView.alpha = 1
            //  VideoView.alpha = 0
            ClickDisplayView.alpha = 0
            CameraDisplayView.alpha = 1
            ClickDisplayView.alpha = 0
            //VideoDisplayView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                // self.ContainerGView.alpha = 0
                
            })
            
        }
        
        
    }
    
    
    
    func CameraNav()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        print("hey boyssss")
        
    }
    func gall(){
        
        
        // create an instance
        let vc = BSImagePickerViewController()
        
        //display picture gallery
        self.bs_presentImagePickerController(vc, animated: false,
                                             select: { (asset: PHAsset) -> Void in
                                                
        }, deselect: { (asset: PHAsset) -> Void in
            // User deselected an assets.
        
        }, cancel: { (assets: [PHAsset]) -> Void in
            // User cancelled. And this where the assets currently selected.
        }, finish: { (assets: [PHAsset]) -> Void in
            // User finished with these assets
            
             self.collectionview.reloadData()
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
                
                let data1 = UIImageJPEGRepresentation(thumbnail, 0.7)
               
                let newImage = UIImage(data: data1 as! Data)
                //let imageData: NSData = UIImageJPEGRepresentation(newImage!, 1.0)! as NSData
                
                self.PhotoArray.append(newImage! as UIImage)
               

            if ((currentReachabilityStatus == .reachableViaWiFi ||  currentReachabilityStatus == .reachableViaWWAN)){




                let postparam="image_url=\(newImage!)&&action=upload_image&&uid=\(userId)&&activity=photo&&tag_status=0&&location_status=0&&caption=jjj";

                APISession.postRequets(objDic: postparam.data(using: String.Encoding.utf8)! as AnyObject, APIURL: "\(url)time_log.php", withAPINo: Int(arc4random_uniform(1234)), completionHandler: { (result, status) in
                    if status {
                        let dt = JSON(data : result as! Data)
                        print(dt)
                        let res : AnyObject = dt.object as AnyObject
                        if let name = res["status"]as? Int as Optional!{
                           // print(name!)
                            if (name == 1)
                            {

                                print("Saved")

                                //  alertDialog(header: "Alert", msg: "Update SuccessFul")


                            }


                            else if(name == 0){
                                let res = dt.object as AnyObject
                                if (res["type"]as? String) != nil{
                                    //  alertDialog(header: "Alert", msg: "Sorry, only JPG, JPEG, PNG & GIF files are allowed.")
                                    print("failed")
                                }
                            }

                        }





                    }
                    else {
                        // self.alertDialog(msg: result as! String)
                    }

                })

            }else {
                print("There is no internet connection")
            }
        }
        
            }
                    //   postimg.animationImages = self.PhotoArray
                 //      self.image.animationDuration = 3.0
//                        self.image.startAnimating()
            
        
        
        
        print("complete photo array \(self.PhotoArray)")
    }

   
}
extension PostsVC: delete{
    func deleteCell(indx: Int) {
       
        PhotoArray.remove(at: indx)
        largeimg.image = nil
        
        if collectionview != nil {
        self.collectionview.reloadData()
        
        }

        
    
    }
}
