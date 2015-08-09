//
//  Video.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import Foundation
class Video {
    
    var name: String? = ""
    var duration: Int? = 0
    var imageURLString: String? = ""
    
    init(dictionary: Dictionary<String, AnyObject>) {
        
        self.name = dictionary["name"] as? String
        self.duration = dictionary["duration"] as? Int
        
        var pictures = dictionary["pictures"] as? Dictionary<String,AnyObject>
        
        if let constPictures = pictures {
            
            var sizes = constPictures["sizes"] as? Array<Dictionary<String,AnyObject>>
            
            if let constSizes = sizes {
                
                if constSizes.count > 0 {
                    var picture = constSizes[0]
                    
                    self.imageURLString = picture["link"] as? String
                    
                }
            }
            
        }
        
    }
    
}