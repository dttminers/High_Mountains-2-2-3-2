//
//  PostsVC.swift
//  High_Mountains
//
//  Created by Abhishek on 23/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PostsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnActiononTab(btnGallery)
    }
    
    
    
    
    @IBAction func btnActiononTab(_ sender: UIButton) {
        
        selectedPhotoIndex = sender.tag
        if sender.tag == 1 {
            GalleryView.alpha = 1
            CaneraView.alpha = 0
            VideoView.alpha = 0
            ClickDisplayView.alpha = 1
            CameraDisplayView.alpha = 0
            VideoDisplayView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                self.ContainerGView.alpha = 1

            })
            
        }else if sender.tag == 2 {
            CameraNav()
            GalleryView.alpha = 0
            CaneraView.alpha = 1
            VideoView.alpha = 0
            ClickDisplayView.alpha = 0
            CameraDisplayView.alpha = 1
            ClickDisplayView.alpha = 0
            VideoDisplayView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                self.ContainerGView.alpha = 0
              
            })
            
        }else if sender.tag == 3 {
            GalleryView.alpha = 0
            CaneraView.alpha = 0
            VideoView.alpha = 1
            ClickDisplayView.alpha = 0
            VideoDisplayView.alpha = 1
            CameraDisplayView.alpha = 0
            ClickDisplayView.alpha = 0

            
            UIView.animate(withDuration: 0.5, animations: {
                self.ContainerGView.alpha = 0
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
    
}
