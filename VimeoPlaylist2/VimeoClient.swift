//
//  VimeoClient.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//
import Foundation
typealias ServerResponseCallback = (videos: Array<Video>?, error: NSError?) -> Void
class VimeoClient {
    static let errorDomain = "VimeoClientErrorDomain"
    static let baseURLString = "https://api.vimeo.com"
    static let staffpicksPath = "/channels/staffpicks/videos"
    static let authToken = "ce92421f6053cb824102f40ac1668471"
    
    class func staffpicks(callback: ServerResponseCallback)  {
        
        let URLString = baseURLString + staffpicksPath
        var URL = NSURL(string: URLString)
        
        if URL == nil {
            var error = NSError(domain: errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to create URL"])
            callback(videos: nil, error: error)
            return
        }
        
        var request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        request.addValue("Bearer " + authToken, forHTTPHeaderField: "Authorization")
        
        var task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if error != nil {
                    callback(videos: nil, error: error)
                    return
                }
                
                var JSONError: NSError?
                var JSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves, error: &JSONError) as? Dictionary<String,AnyObject>
                
                if let constJSONError = JSONError {
                    
                    callback(videos: nil, error: JSONError)
                    
                    return
                }
                
                if JSON == nil {
                    var error = NSError(domain: self.errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to parse JSON"])
                    callback(videos: nil, error: error)
                    
                    return
                }
                
                var videoArray = Array<Video>()
                
                if let constJSON = JSON {
                    var dataArray = constJSON["data"] as? Array<Dictionary<String,AnyObject>>
                    
                    if let constArray = dataArray {
                        
                        for value in constArray {
                            
                            let video = Video(dictionary: value)
                            videoArray.append(video)
                        }
                    }
                }
                
                callback(videos: videoArray, error: nil)
            })
        })
        
        task.resume()
    }
}