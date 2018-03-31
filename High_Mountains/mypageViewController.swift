//
//  mypageViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 13/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class mypageViewController: UIViewController {

    @IBOutlet weak var scrolview: UIScrollView!
    @IBOutlet weak var pagecontroler: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        for image in 0...2{
            let imageToDisplay = UIImage(named: "download")
            let imageview = UIImageView(image: imageToDisplay)
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
            scrolview.addSubview(imageview)
            imageview.frame = CGRect(x: xCoordinate, y: view.frame.height/2, width: 100, height: 100)
        }
        
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
