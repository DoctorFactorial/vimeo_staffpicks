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
        
        var artistArray = dictionary["artists"] as? Array<Dictionary<String,AnyObject>>
        
        if let constArtist = artistArray {
            
            if constArtist.count > 0 {
            
                var artist = constArtist[0]
                
                self.artist = artist["name"] as? String
                
                self.imageURLString = artist["avatar"] as? String
            
            }
        

        }
        
        
    }
    
}