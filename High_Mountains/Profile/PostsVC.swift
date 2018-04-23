//
//  PostsVC.swift
//  High_Mountains
//
//  Created by Abhishek on 23/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PostsVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

   
    
    @IBAction func SegmentControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            let controller = STORY_BOARD.instantiateViewController(withIdentifier: "postsAlbum")
             self.navigationController?.present(controller, animated: true, completion: nil)
            break
        case 1:
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
             print("hey boyssss")
            break
        default:
            break
        }
        
        
    }
    
   

}
