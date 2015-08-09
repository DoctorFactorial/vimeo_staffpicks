//
//  Video.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import Foundation
class Video {
    
    var title: String? = ""
    var artist: String? = ""
    var imageURLString: String? = ""
    
    init(dictionary: Dictionary<String, AnyObject>) {
        
        self.title = dictionary["title"] as? String
        
        var ownerArray = dictionary["owner"] as? Array<Dictionary<String,AnyObject>>
        
        if let constOwner = ownerArray {
            
            if constOwner.count > 0 {
            
                var owner = constOwner[0]
                
                self.artist = owner["name"] as? String
                
                self.imageURLString = owner["avatar"] as? String
            
            }
        

        }
        

        
//        var pictures = dictionary["pictures"] as? Dictionary<String,AnyObject>
//        
//        if let constPictures = pictures {
//            
//            var sizes = constPictures["sizes"] as? Array<Dictionary<String,AnyObject>>
//            
//            if let constSizes = sizes {
//                
//                if constSizes.count > 0 {
//                    var picture = constSizes[0]
//                    
//                    self.imageURLString = picture["link"] as? String
//                    
//                }
//            }
//            
//        }
        
    }
    
}