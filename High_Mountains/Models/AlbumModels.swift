//
//  AlbumModels.swift
//  High_Mountains
//
//  Created by Abhishek on 06/04/18.
//  Copyright © 2018 Abhishek. All rights reserved.
//

import Foundation


class photo : NSObject {

    var image_url = String()


func setDictionary(_ dictionary:[AnyHashable : Any]){
    
    if let name = dictionary["image_url"] as? String {
        self.image_url = name
}
}
}
