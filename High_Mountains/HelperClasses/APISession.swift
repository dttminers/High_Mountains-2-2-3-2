//
//  APISession.swift
//  CloudBar
//
//  Created by Shivam Dubey on 21/12/17.
//  Copyright © 2017 Shivam Dubey. All rights reserved.
//

import Foundation
import UIKit
class APISession {
    
    class func postRequets(objDic: AnyObject,APIURL: String, withAPINo apiNo: Int, completionHandler: @escaping (_ result: Any, _ status: Bool) -> Void) {
        
        print("[\(apiNo)] Request Str : \(APIURL)")
        let pp = NSString(data: (objDic as! NSData) as Data, encoding: String.Encoding.utf8.rawValue)!
        print("[\(apiNo)] Post Params : \(pp)")
        
        let request = NSMutableURLRequest(url: NSURL(string: APIURL)! as URL)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let postString = objDic
        request.httpMethod = "POST"
        request.timeoutInterval = 15
        request.addValue("application/x-www-form-urlencoded",forHTTPHeaderField: "Content-Type")
        request.addValue("*/*",forHTTPHeaderField: "Accept")
        request.httpBody = postString as? NSData as Data?
        print(request)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in DispatchQueue.main.async(execute: {
                if error != nil {
                    completionHandler(no_internet, false)
                }
                else {
                    let httpResponse = response as! HTTPURLResponse
                    print("[\(apiNo)] httpResponse -> \(httpResponse.statusCode)")
                    switch httpResponse.statusCode {
                    case 503:
                        completionHandler(err_no_503, false)
                        break
                    case 404:
                        completionHandler(err_no_404, false)
                        break
                    case 200:
                        completionHandler(data as Any, error == nil)
                        break
                    default:
                        completionHandler(err_default, false)
                        break
                    }
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            })
        }
        task.resume()
        
        //completionHandler(nil, error == nil)
    }
    
    class func getRequets(APIURL: String, withAPINo apiNo: Int, completionHandler: @escaping (_ result: Any, _ status: Bool) -> Void) {
        
        print("[\(apiNo)] Request Str : \(APIURL)")
        
        let request = NSMutableURLRequest(url: NSURL(string: APIURL)! as URL)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        request.httpMethod = "GET"
        request.timeoutInterval = 15
        request.addValue("application/x-www-form-urlencoded",forHTTPHeaderField: "Content-Type")
        request.addValue("*/*",forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in DispatchQueue.main.async(execute: {
                if error != nil {
                    completionHandler(no_internet, false)
                }
                else {
                    let httpResponse = response as! HTTPURLResponse
                    print("[\(apiNo)] httpResponse -> \(httpResponse.statusCode)")
                    switch httpResponse.statusCode {
                    case 503:
                        completionHandler(err_no_503, false)
                        break
                    case 404:
                        completionHandler(err_no_404, false)
                        break
                    case 200:
                        completionHandler(data as Any, error == nil)
                        break
                    case 500:
                        completionHandler(err_no_404, false)
                        break
                    default:
                        completionHandler(err_default, false)
                        break
                    }
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            })
        }
        task.resume()
        
        //completionHandler(nil, error == nil)
    }

}
