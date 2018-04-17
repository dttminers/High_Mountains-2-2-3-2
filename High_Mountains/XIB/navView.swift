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
    var isBack : Bool?
    
    override func awakeFromNib() {
        
        
    }
    
    override func didMoveToWindow() {
        if isBack! {
            btnLeft.setImage(#imageLiteral(resourceName: "Backicon"), for: .normal)
            btnRight.isHidden = true
            viewSearch.isHidden = true
            viewHeading.isHidden = false
            btnSearch.isHidden = true
        }
        else {
            btnLeft.setImage(#imageLiteral(resourceName: "slide-1"), for: .normal)
            btnRight.isHidden = false
            viewSearch.isHidden = true
            viewHeading.isHidden = false
            btnSearch.isHidden = false
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
        if isBack! {
            self.nvc?.popViewController(animated: true)
        }
        else {
            if viewSearch.isHidden {
                btnLeft.setImage(#imageLiteral(resourceName: "slide-1"), for: .normal)
                navView.delegateSlide.open()
            }
            else {
                btnSearchAction(self)
            }
        }
        
    }
    
    @IBAction func btnRightAction(_ sender: Any) {
        let vc : profileVC = STORY_BOARD.instantiateViewController(withIdentifier: "profileVC") as! profileVC
        nvc?.pushViewController(vc, animated: true)
    }
    
    class func instanceFromNib() -> navView {
        return UINib(nibName: "navVew", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! navView
    }
}

extension UINavigationBar
{
    func showView (_ nav : UINavigationBar,navigationItem : UINavigationItem, navigationController : UINavigationController, isBack : Bool)
    {
        for view in nav.subviews{
            view.removeFromSuperview()
        }
        navigationItem.setHidesBackButton(true, animated: false)
        let viewN =  navView.instanceFromNib() as navView
        viewN.nvc = navigationController
        viewN.isBack = isBack
        viewN.frame = CGRect(x: 0, y: 0, width: nav.frame.size.width, height: nav.frame.size.height)//nav.frame
        
        viewN.bringSubview(toFront: nav)
        nav.addSubview(viewN)
    }
}
