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
    
    func setUserInfoDictionary(_ item:AnyObject) ->  UserInfoModel {
        let object =  UserInfoModel()
        object.setDictionary(item as! [AnyHashable : Any])
        return object
    }
    
    func setTimelineDictionary(_ array:[AnyObject]) ->  [TimelineModel] {
        var models:[TimelineModel] = []
        for item in array
        {
            let object =  TimelineModel()
            object.setDictionary(item as! [AnyHashable : Any])
            models.append(object)
        }
        return models
    }
    
    func setPhotoDictionary(_ array:[AnyObject]) ->  [PhotoModel] {
        var models:[PhotoModel] = []
        for item in array
        {
            let object =  PhotoModel()
            object.setDictionary(item as! [AnyHashable : Any])
            models.append(object)
        }
        return models
    }
    
    func setDestinationDictionary(_ array:[AnyObject]) ->  [AllDestination] {
        var models:[AllDestination] = []
        for item in array
        {
            let object = AllDestination()
            object.setDictionary(item as! [AnyHashable : Any])
            models.append(object)
        }
        return models
    }
    
    func setThemesDictionary(_ array:[AnyObject]) ->  [TravelTheme] {
        var models:[TravelTheme] = []
        for item in array
        {
            let object = TravelTheme()
            object.setDictionary(item as! [AnyHashable : Any])
            models.append(object)
        }
        return models
    }


func setFetchRequestDictionary(_ array:[AnyObject]) ->  [FetchRequest] {
    var models:[FetchRequest] = []
    for item in array
    {
        let object = FetchRequest()
        object.setDictionary(item as! [AnyHashable : Any])
        models.append(object)
    }
    return models
}


func sendCommentDictionary(_ array:[AnyObject]) ->  [SendComment] {
    var models:[SendComment] = []
    for item in array
    {
        let object = SendComment()
        object.setDictionary(item as! [AnyHashable : Any])
        models.append(object)
    }
    return models
}


func sendLikeDisplayDictionary(_ array:[AnyObject]) ->  [LikeDisplay] {
    var models:[LikeDisplay] = []
    for item in array
    {
        let object = LikeDisplay()
        object.setDictionary(item as! [AnyHashable : Any])
        models.append(object)
    }
    return models
    
  
}

}
