//
//  PlaylistOneViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit
class PlaylistViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    

    var items: Array<Video> = []
    
    var playlistItems: Array<Playlist> = []
    
    
    // Empty Playlist array to be populated from YourMusicViewController
    var playlists: Array<String> = []
    var index: Int = 0
    
    var playlist: String = ""
    

    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Popular Tracks"

        self.setupTableView()
        
        self.playlist = playlists[index]
        
        self.refreshItems(playlist)
        
        
        
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden((false), animated: false)
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 1, green: 112/255, blue: 114/255, alpha: 1)
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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