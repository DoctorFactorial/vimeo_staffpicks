//
//  Playlist.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import Foundation

class Playlist {
    
    var title: String? = ""
    var id: String? = ""
    
    init(dictionary: Dictionary<String, AnyObject>) {
        
        self.title = dictionary["title"] as? String
        
        self.id = dictionary["_id"] as? String
        
    }
    
}