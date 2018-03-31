//
//  Constant.swift
//  CloudBar
//
//  Created by Shivam Dubey on 21/12/17.
//  Copyright © 2017 Shivam Dubey. All rights reserved.
//

import Foundation
import UIKit

let APPNAME = "HM"

//URL
let url : String = "http://vnoi.in/hmapi/"

var userId = ""
var userData : [String : String] = [:]

let imageCache = NSCache<NSString, AnyObject>()
//TODO:- Colors

let themeColor = UIColor(red: 16.0/255.0, green: 16.0/255.0, blue: 16.0/255.0, alpha: 1.0)
let orangeColor = UIColor(red: 255.0/255.0, green: 99.0/255.0, blue: 71.0/255.0, alpha: 1.0)
let greenColor = UIColor(red: 20.0/255.0, green: 157.0/255.0, blue: 151.0/255.0, alpha: 1.0)
let skyColor = UIColor(red: 111.0/255.0, green: 229.0/255.0, blue: 253.0/255.0, alpha: 1.0)
let darkBlueColor = UIColor(red: 87.0/255.0, green: 87.0/255.0, blue: 120.0/255.0, alpha: 1.0)

let segmentColor = UIColor(red: 74.0/255.0, green: 76.0/255.0, blue: 129.0/255.0, alpha: 1.0)
let selectedSegmentColor = UIColor(red: 151.0/255.0, green: 128.0/255.0, blue: 252.0/255.0, alpha: 1.0)

let STORY_BOARD = UIStoryboard(name: "Main", bundle: nil)
let TAB_HEIGHT:CGFloat = 54.0
let TAB_BG_COLOR = UIColor(red: 76.0/255.0, green: 76.0/255.0, blue: 129.0/255.0, alpha: 1.0)

let clear = UIColor(red: CGFloat(0.0/0.0), green: CGFloat(0.0/0.0), blue: CGFloat(0.0/0.0), alpha: CGFloat(0.0))
let blur = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(0.0/255.0), alpha: CGFloat(0.4))

let MSG_FONT = UIFont(name: "Averta-Light", size: 17.0)

let SCREEN_WIDTH = AppUtility.getScreenWidth()
let SCREEN_HEIGHT = AppUtility.getScreenHeight()

let IS_IPHONE4 = SCREEN_HEIGHT == 480.0
let IS_IPHONE5 = SCREEN_HEIGHT == 568.0
let IS_IPHONE6 = SCREEN_HEIGHT == 667.0
let IS_IPHONE6P = SCREEN_HEIGHT == 736.0
let IS_IPAD = SCREEN_HEIGHT > 736

let NOTIF_MOVE_TAB_INDEX = "MoveTabIndex"
let NOTIF_REFRESH_PLAYER = "RefreshPlayer"

let AD = UIApplication.shared.delegate as! AppDelegate

//let img_play = UIImage(named: "icon_play")
//let img_pause = UIImage(named: "icon_pause")
let img_play_music = UIImage(named: "btn_play")
let img_pause_music = UIImage(named: "btn_pause")


//USER DEFAULTS KEY
let defaults = UserDefaults.standard
let ud_key_userData = "UserData"
let ud_key_userID = "UserID"

//For STORING STATIC DATA


//For Error msgs
let no_internet = "Please Check your Internet Connectivity"
let err_no_503 = "Service is unavailable"
let err_no_500 = "Please try again later"
let err_no_404 = "No Response From Server"
let err_no_0 = "No Response From Server"
let err_default = "Something went wrong, Please check your internet connection."
let something_went_wrong = "Something went wrong."

func createMenuView() {
    /*let window = UIApplication.shared.windows[0]
    
    // create viewController code...
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let leftViewController = storyboard.instantiateViewController(withIdentifier: "qwe") as! MasterViewController
    
    let nvc : UINavigationController = (storyboard.instantiateViewController(withIdentifier: "customNVC") as? customNVC)! //UINavigationController(rootViewController: mainViewController)
    
    let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
    slideMenuController.automaticallyAdjustsScrollViewInsets = true
    window.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    window.rootViewController = slideMenuController
    window.makeKeyAndVisible()*/
}
/*
func goToLogin() {
    let vc = STORY_BOARD.instantiateViewController(withIdentifier: "loginVC") as! loginVC
    let window = UIApplication.shared.windows[0]
    window.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
    window.rootViewController = vc
    window.makeKeyAndVisible()
}*/

func checkNULLString(_ passedStr: Any) -> String {
    var returnStr: String!
    if (passedStr is NSNumber) {
        returnStr = "\(passedStr)"
    }
    else {
        returnStr = (passedStr as? String == nil) ? "" : "\(passedStr)"
    }
    if returnStr == "" {
        return ""
    }
    else if (returnStr == "(Null)") || (returnStr == "Null") || (returnStr == "(NULL)") || (returnStr == "((NULL))") || (returnStr == "((null))") || (returnStr == "NULL") || (returnStr == "(null)") || (returnStr == "null") || returnStr.isEqual(NSNull()) || returnStr.isEqual(NSNull.self) {
        return ""
    }
    else if (returnStr == "(Nil)") || (returnStr == "Nil") || (returnStr == "(NIL)") || (returnStr == "NIL") || (returnStr == "(nil)") || (returnStr == "nil") || returnStr == nil {
        return ""
    }
    else if (returnStr == "") || (returnStr == " ") {
        return ""
    }
    else {
        return returnStr.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
