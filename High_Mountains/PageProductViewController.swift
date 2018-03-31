//
//  PageProductViewController.swift
//  High_Mountains
//
//  Created by Abhishek on 13/03/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import UIKit

class PageProductViewController: UIPageViewController {
    
    var images: [UIImage]? = #imageLiteral(resourceName: "download").images
    
    
    
    struct storyboard{
        static let ScrolimgViewController = "ScrolimgViewController"
        
    }
    
    lazy var controllers: [UIViewController] = {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil )
        var controllers = [UIViewController]()
        if let images = self.images
        {
            let scrollImageVC = Storyboard.instantiateViewController(withIdentifier: storyboard.ScrolimgViewController)
            controllers.append(scrollImageVC)
            
        }
      return controllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        //delegate = self
        
        self.turnToPage(index: 0)
    }
    
    func turnToPage(index:Int)
    {
        let controller = controllers[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        
        if let currentVC = viewControllers?.first{
            
            let currentIndex = controllers.index(of:currentVC)
        // if currentIndex > index {
                direction = .reverse
 //}
        }
        
       self.ConfigureDisplaying(viewController:controller)
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func ConfigureDisplaying(viewController: UIViewController)
    {
        for (index,VC) in controllers.enumerated(){
            if viewController === VC{
                if let pageImageVC = viewController as?ScrolimgViewController{
                   pageImageVC.image = self.images?[index]
                    
                }
            }
        }
    }
}
extension PageProductViewController: UIPageViewControllerDataSource{
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of:viewController){
            if index>0{
                return controllers[index-1]
            }
            
        }
        return controllers.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.index(of:viewController){
            
            if index < controllers.count-1{
                return controllers[index+1]
            }
        }
        
        return controllers.first
    }
    
    
       
    }

    


