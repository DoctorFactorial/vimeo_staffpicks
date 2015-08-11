//
//  RockRadioClient.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

//
//  VimeoClient.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//
import Foundation

typealias RockRadioResponseCallback = (videos: Array<Video>?, error: NSError?) -> Void

class RockRadioClient {
    
    static let errorDomain = "RockRadioClientErrorDomain"
    
    static let baseURLString = "http://134.213.62.164:8080"
    
    static let songsSearchPath = "/songs/search?"
    
    static let keyword = "rock"
    
    static let authToken = "557ffc7aae8c50de268b4567"
    
    class func popular(callback: ServerResponseCallback)  {
        
        let URLString = baseURLString + songsSearchPath + "keyword=" + keyword
        var URL = NSURL(string: URLString)
        
        if URL == nil {
            var error = NSError(domain: errorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey : "Unable to create URL"])
            callback(videos: nil, error: error)
            return
        }
        
        var request = NSMutableURLRequest(URL: URL!)
        request.HTTPMethod = "GET"
        request.addValue(authToken, forHTTPHeaderField: "Authorization")
        
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
                    var dataArray = constJSON["data_response"] as? Array<Dictionary<String,AnyObject>>
                    
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
