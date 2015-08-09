//
//  VimeoClient.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import Foundation
typealias ServerResponseCallback = (object: Dictionary<String,AnyObject>?, error: NSError?) -> Void
class VimeoClient {
    class func staffpicks(callback: ServerResponseCallback)  {
        callback(object: nil, error: nil)
    }
}