//
//  PlaylistOneViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit
import YouTubePlayer

class PlaylistViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    
    // Initiaze vars
    var items: Array<Video> = []
    var playlistItems: Array<Playlist> = []
    var backgroundColor: UIColor = UIColor(red: 0/255, green: 165/255, blue: 229/255, alpha: 1.0)
    var titleText: String = ""
    
    // Empty Playlist array to be populated from YourMusicViewController
    var playlists: Array<String> = []
    var index: Int = 0
    var playlist: String = ""
    
    // Connect to Youtube Player
    //@IBOutlet var WebView: UIWebView!
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Remove Navigation title
        self.navigationController?.navigationBar.topItem!.title = ""
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width = screenSize.width - 100
        
        // Add View Title Dynamically
        let title = UILabel()
        title.text = titleText
        title.textAlignment = .Center
        title.frame = CGRectMake(50, 22, width, 44)
        title.textColor = UIColor.whiteColor()
        title.font =  UIFont(name: "Avenir Book", size: 26)
        self.view.addSubview(title)

        

        self.setupTableView()
        
        self.playlist = playlists[index] // Requires 5s delay for API call. Solved with User implementation
        
        self.refreshItems(playlist)
        
        // Colours set by button colour
        self.view.backgroundColor = backgroundColor
        self.tableView?.separatorColor = backgroundColor
        
        // Setup Youtube Player
        var playerFrame = CGRect(x:2, y:22, width:300, height:200)
        var videoPlayer = YouTubePlayerView(frame: playerFrame)
        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=wQg3bXrVLtg")
        videoPlayer.loadVideoURL(myVideoURL!)
        
        
        
        
        
//        var YouTubeLink:String = "http://youtube.com/embed/5qwyoi3sQPI"
//        let width = 300
//        let height = 200
//        let frame = 10
//
//        let Code:NSString = "<iframe width=\(width) height=\(height) src=\(YouTubeLink) frameborder=\(frame) allowfullscreen></iframe>";
//        self.WebView.loadHTMLString(Code as String, baseURL: nil)
        
        
        
        
//        var videoIdentifier: NSString = "EdeVaT-zZt4"; // A 11 characters YouTube video identifier
//        [[XCDYouTubeClient defaultClient] getVideoWithIdentifier:videoIdentifier completionHandler:^(XCDYouTubeVideo *video, NSError *error) {
//        if (video)
//        {
//        // Do something with the `video` object
//        }
//        else
//        {
//        // Handle error
//        }
//        }];
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden((false), animated: false)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()

        
        self.navigationController?.navigationBar.topItem!.title = ""
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        
    }

    
    // MARK: Setup
    
    func setupTableView() {
        let nib = UINib(nibName: "VideoCell", bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier: NSStringFromClass(VideoCell.self))
        
        
        
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(VideoCell.self)) as! VideoCell
        
        let video = self.items[indexPath.row]
        cell.video = video
        
        return cell
    }
    
    func refreshItems(playlist_id: String) {
        PlaylistClient.popular(playlist_id) { videos, error -> Void in
            
            if let constVideos = videos {
                
                for video: Video in constVideos {
                    
                    self.items = constVideos
                    
                    self.tableView?.reloadData()
                }
            }
            else {
                // TODO: alert the user
            }
        }
    }
    
    func refreshPlaylist() -> Array<String> {
        
        var playlistArray = Array<String>()
        
        PopularPlaylistsClient.popular { playlists, error -> Void in
            
            
            if let constPlaylists = playlists {
                
                for playlist: Playlist in constPlaylists {
                    
                    self.playlistItems = constPlaylists

                }
                
                
            }
            else {
                // TODO: alert the user
            }
            
            
        }
        
        return playlistArray
    }

    
}