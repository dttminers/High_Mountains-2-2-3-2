//
//  extensions.swift
//  CloudBar
//
//  Created by Shivam Dubey on 21/12/17.
//  Copyright © 2017 Shivam Dubey. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func existInCache(urlString : String) -> Bool
    {
        if imageCache.object(forKey: urlString as NSString) != nil {
            return true
        }
        else {
            return false
        }
    }
    
    func updateCache(urlString : String, value : AnyObject) {
        imageCache.setObject(value, forKey: urlString as NSString)
    }
    
    func getWeekNumber() -> Int
    {
        let calendar = Calendar.current
        let weekOfYear = calendar.component(.weekOfYear, from: Date.init(timeIntervalSinceNow: 0))
        print(weekOfYear)
        return weekOfYear
    }
    
    func getMonthNumber() -> Int
    {
        let calendar = Calendar.current
        let weekOfYear = calendar.component(.month, from: Date.init(timeIntervalSinceNow: 0))
        print(weekOfYear)
        return weekOfYear
    }
    
    func getCurrentDate() -> String
    {
        let date = Date()
        let df : DateFormatter = DateFormatter()
        df.dateFormat = "dd-MMMM_yyyy"
        return df.string(from: date)
    }
	
    func alertDialog(msg : String){
        let alrt = UIAlertController(title: APPNAME, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel) { (action) in
            
        }
        alrt.addAction(cancel)
        alrt.view.tintColor = UIColor.blue
        self.present(alrt, animated: true, completion: nil)
    }
    
    func AirplaneAlertDialog2Btns(completion: @escaping () -> ()){
        let alrt = UIAlertController(title: APPNAME, message: "To avoid any interruptions, put your phone on Airplane mode.", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
            
        }
        alrt.addAction(cancel)
        let ok = UIAlertAction(title: "Proceed", style: UIAlertActionStyle.default) { (action) in
            completion()
        }
        alrt.addAction(ok)
        alrt.view.tintColor = UIColor.blue
        self.present(alrt, animated: true, completion: nil)
    }
    
    func alertDialog(header : String,msg : String){
        let alrt = UIAlertController(title: header, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        let cancel = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (action) in
            
        }
        alrt.addAction(cancel)
        alrt.view.tintColor = UIColor.blue
        self.present(alrt, animated: true, completion: nil)
    }
    
    func uniq<S: Sequence, E: Hashable>(source: S) -> [E] where E==S.Iterator.Element {
        var seen: [E:Bool] = [:]
        //return self.filter { seen.updateValue(true, forKey: $0) == nil }
        return source.filter { seen.updateValue(true, forKey: $0) == nil }
    }
	
	func isValidEmail(testStr:String) -> Bool {
		// println("validate calendar: \(testStr)")
		let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
		
		let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
		return emailTest.evaluate(with: testStr)
	}
    
	func isValidPhone(value: String) -> Bool {
		let PHONE_REGEX = "^\\d{3}\\d{3}\\d{4}$"
		let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
		let result =  phoneTest.evaluate(with: value)
		return result
	}
	
	func loadingView(flag : Bool){
        var inloading = false
        for vew in self.view.subviews {
            if vew.tag == 999 {
                inloading = true
                break
            }
        }
		if flag {
            if !inloading {
                let v = UIView(frame: CGRect(x: 0,y : 0,width : SCREEN_WIDTH, height : SCREEN_HEIGHT))
                v.backgroundColor = blur
                let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
                activityView.center = v.center
                activityView.startAnimating()
                v.addSubview(activityView)
                self.view.addSubview(v)
            }
		}
		else {
            if inloading {
                let c = self.view.subviews.count
                self.view.subviews[c-1].removeFromSuperview()
            }
			
		}
	}
}

extension String {
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(from: Int) -> String {
        return self.substring(from : self.index(startIndex, offsetBy: from))//.startIndex.advancedBy(from))
    }
    
//    var length: Int {
//        return self.characters.count
//    }
}

public extension UITableView {
    
    func registerCellClass(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerCellNib(cellClass: AnyClass) {
        let identifier = String.className(aClass: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewClass(viewClass: AnyClass) {
        let identifier = String.className(aClass: viewClass)
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewNib(viewClass: AnyClass) {
        let identifier = String.className(aClass: viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
}

extension UIApplication {
    
    class func topViewController(viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(viewController: selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        
       // if let slide = viewController as? SlideMenuController {
          //  return topViewController(viewController: slide.mainViewController)
       // }
        return viewController
    }
    
  

}

extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        self.image = nil
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }
            
        }).resume()
    }
}
