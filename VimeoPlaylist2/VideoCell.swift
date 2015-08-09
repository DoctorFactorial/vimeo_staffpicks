//
//  VideoCell.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit
class VideoCell: UITableViewCell {
    
    var task: NSURLSessionDataTask?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var durationLabel: UILabel?
    @IBOutlet weak var videoImageView: UIImageView?
    
    var video: Video? {
        didSet {
            if let constVideo = video {
                
                self.nameLabel?.text = constVideo.name
                
                if let constDuration = constVideo.duration {
                    self.durationLabel?.text = "\(constDuration)"
                }
                else {
                    self.durationLabel?.text = "0"
                }
                
                if let constImageURLString = constVideo.imageURLString {
                    let url = NSURL(string: constImageURLString)!
                    
                    self.task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {( data, response, error) -> Void in
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.task = nil
                            if data != nil {
                                let image = UIImage(data: data)
                                self.videoImageView?.image = image
                                
                            }
                            else {
                                // TODO: alert the user?
                            }
                        })
                    })
                    
                    self.task?.resume()
                    
                }
            }
        }
    }
    
    override func prepareForReuse() {
        self.nameLabel?.text = ""
        self.durationLabel?.text = ""
        self.videoImageView?.image = nil
        self.task?.cancel()
        self.task = nil
    }
    
    
}