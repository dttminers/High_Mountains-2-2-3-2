//
//  CameraProfileViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 16/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class CameraProfileViewController: UIViewController {

    override func viewDidLoad() {
        //self.loadDesign()
        super.viewDidLoad()
 
        
    }


    
 /*   override public func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child1 = UIStoryboard(name: "Main" , bundle:nil).instantiateViewController(withIdentifier: "collection1")
        let child2 = UIStoryboard(name: "Main" , bundle:nil).instantiateViewController(withIdentifier: "collection2")
          let child3 = UIStoryboard(name: "Main" , bundle:nil).instantiateViewController(withIdentifier: "collection3")
        return [child1,child2,child3]
        
        
    }
   func loadDesign()
    {
        self.settings.style.selectedBarHeight = 1
        self.settings.style.selectedBarBackgroundColor = UIColor.black
        self.settings.style.buttonBarBackgroundColor = .black
        self.settings.style.buttonBarItemBackgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        self.settings.style.selectedBarBackgroundColor = .white
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 4.0
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = .white
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 10
        self.settings.style.buttonBarRightContentInset = 10
        self.settings.style.buttonBarMinimumInteritemSpacing = 0
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
            newCell?.label.textColor = .black
        }
        
        
    }
}*/
}

extension CameraProfileViewController : IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "FirstTab")
}
}

