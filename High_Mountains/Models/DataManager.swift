//
//  DataManager.swift
//  High_Mountains
//
//  Created by Shivam Dubey on 06/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation

private var manager : DataManager? = nil

class DataManager {
    
    class func shared() -> DataManager{
        if manager == nil{
            manager = DataManager()
        }
        return manager ?? DataManager()
    }
    
    func setFollowDictionary(_ array:[AnyObject]) ->  [FollowModel] {
        
        var models:[FollowModel] = []
        for item in array
        {
            let object =  FollowModel()
            object.setDictionary(item as! [AnyHashable : Any])
            models.append(object)
        }
        return models
    }
}
