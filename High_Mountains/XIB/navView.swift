//
//  navView.swift
//  CustomNavigationBarDemo
//
//  Created by Shivam Dubey on 10/04/18.
//  Copyright © 2018 Shivam Dubey. All rights reserved.
//

import UIKit

class navView: UIView {

    static var delegateSlide : slideMenuDelegate!
    
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    
    @IBOutlet weak var viewHeading: UIView!
    @IBOutlet weak var viewSearch: UIView!
    
    @IBOutlet weak var lblHeading: UILabel!
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var search: UISearchBar!
    
    var nvc : UINavigationController? = nil
    //var isBack : Bool?
    var isBack : Int?
    var lblheading : String = ""
//    override func awakeFromNib() {
//        
//       
//    }
    
    override func didMoveToWindow() {
        if isBack == 0 {
            btnLeft.setImage(#imageLiteral(resourceName: "back"), for: .normal)
            btnRight.isHidden = true
            viewSearch.isHidden = true
            viewHeading.isHidden = false
            btnSearch.isHidden = true
            
        }
      else if isBack == 1{
            btnLeft.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
            btnRight.setImage(#imageLiteral(resourceName: "sendshare"), for: .normal)
            btnSearch.isHidden = true
            viewSearch.isHidden = true
            btnRight.isHidden = false
            viewHeading.isHidden = false
            lblHeading.textAlignment = .center
        }
        else if isBack == 2{
           btnSearch.setImage(#imageLiteral(resourceName: "Search1"), for: .normal)
           btnRight.isHidden = true
           viewSearch.isHidden = false
           viewHeading.isHidden = true
           btnSearch.isHidden = false
        }
        else if isBack == 3{
            
            btnSearch.isHidden = true
            viewSearch.isHidden = true
            btnRight.isHidden = true
            viewHeading.isHidden = false
            lblHeading.textAlignment = .center
            
        }
        else if isBack == 4{
           
            btnRight.setImage(#imageLiteral(resourceName: "moreicon"), for: .normal)
            btnSearch.isHidden = true
            viewSearch.isHidden = true
            btnRight.isHidden = false
            viewHeading.isHidden = false
            lblHeading.textAlignment = .justified
            
        }
        else if isBack == 5{
            
            btnRight.setImage(#imageLiteral(resourceName: "next"), for: .normal)
            btnSearch.isHidden = true
            viewSearch.isHidden = true
            btnRight.isHidden = false
            viewHeading.isHidden = false
            lblHeading.textAlignment = .left
            
        }
    }
    
    @IBAction func btnSearchAction(_ sender: Any) {
        
        if viewHeading.isHidden {
            btnLeft.setImage(#imageLiteral(resourceName: "slide-1"), for: .normal)
            viewSearch.isHidden = true
            viewHeading.isHidden = false
            self.endEditing(true)
        }
        else {
            btnLeft.setImage(#imageLiteral(resourceName: "RightArrow"), for: .normal)
            viewSearch.isHidden = false
            viewHeading.isHidden = true
            search.becomeFirstResponder()
        }
      
            
        
    }
    
    @IBAction func btnLeftAction(_ sender: Any) {
        if isBack == 0 {
            self.nvc?.popViewController(animated: true)
        }
        else if isBack == 1 {
            print("hh")
//            if viewSearch.isHidden {
//               // btnLeft.setImage(#imageLiteral(resourceName: "slide-1"), for: .normal)
//              //  navView.delegateSlide.open()
        }
            else {
                btnSearchAction(self)
            }
        }
        
//}
    
    @IBAction func btnRightAction(_ sender: Any) {
//        let vc: ProfileDetailsVC  = PROFILE_STORYBOARD.instantiateViewController(withIdentifier: "ProfileDetails")as! ProfileDetailsVC
//        nvc?.pushViewController(vc, animated: true)
        if isBack == 4 {
        print("d")
        }
    }
    
    class func instanceFromNib() -> navView {
        return UINib(nibName: "navVew", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! navView
    }
}

extension UINavigationBar
{
    func showView (_ nav : UINavigationBar,navigationItem : UINavigationItem, navigationController : UINavigationController, isBack : Int,lblheading : String )
    {
        for view in nav.subviews{
            view.removeFromSuperview()
        }
        navigationItem.setHidesBackButton(true, animated: false)
        let viewN =  navView.instanceFromNib() as navView
        viewN.nvc = navigationController
        viewN.isBack = isBack
        viewN.lblHeading.text = lblheading
        viewN.frame = CGRect(x: 0, y: 0, width: nav.frame.size.width, height: nav.frame.size.height)//nav.frame
        viewN.bringSubview(toFront: nav)
        nav.addSubview(viewN)
 
    }
}
