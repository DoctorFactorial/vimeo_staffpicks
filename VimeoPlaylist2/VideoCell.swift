//
//  VideoCell.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit
class VideoCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var durationLabel: UILabel?
    
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
            }
            
        }
    }
    
    override func prepareForReuse() {
        self.nameLabel?.text = ""
        self.durationLabel?.text = ""
    }
    
    
}