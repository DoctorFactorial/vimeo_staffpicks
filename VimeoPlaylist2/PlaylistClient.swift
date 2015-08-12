//
//  PlaylistClient.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import Foundation

typealias PlaylistServerResponseCallback = (playlists: Array<Playlist>?, error: NSError?) -> Void

class PlaylistClient {
    static let errorDomain = "YouTubeClientErrorDomain"
    
    static let baseURLString = "http://134.213.62.164:8080"
    
    static let playlistsPath = "/playlists/popular"
    
    static let authToken = "557ffc7aae8c50de268b4567"
    
    class func popular(callback: PlaylistServerResponseCallback)  {
        
        let URLString = baseURLString + playlistsPath 
        var URL = NSURL(string: URLString)
        
        if URL == nil {
            var error = NSError(domain: errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to create URL"])
            callback(playlists: nil, error: error)
            return
        }
        
        var request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        request.addValue(authToken, forHTTPHeaderField: "Authorization")
        
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if error != nil {
                    callback(playlists: nil, error: error)
                    return
                }
                
                var JSONError: NSError?
                var JSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: &JSONError) as? Dictionary<String,AnyObject>
                
                if let constJSONError = JSONError {
                    
                    callback(playlists: nil, error: JSONError)
                    
                    return
                }
                
                if JSON == nil {
                    var error = NSError(domain: self.errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to parse JSON"])
                    callback(playlists: nil, error: error)
                    
                    return
                }
                
                var playlistArray = Array<Playlist>()
                
                if let constJSON = JSON {
                    var dataArray = constJSON["data_response"] as? Array<Dictionary<String,AnyObject>>
                    
                    if let constArray = dataArray {
                        
                        for value in constArray {
                            
                            let playlist = Playlist(dictionary: value)
                            playlistArray.append(playlist)
                            //println(playlist.id)
                        }
                    }
                }
                
                callback(playlists: playlistArray, error: nil)
            })
        })
        
        task.resume()
    }
}
