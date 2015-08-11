//
//  PlaylistsViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 10/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class YourMusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshPlaylists()
        self.navigationController?.navigationBarHidden = true

        // MARK: Popular Button
        let popularLabel = UILabel()
        let popularButton = UIButton()
        popularLabel.frame = CGRectMake(50, 200, 275, 44)
        popularButton.backgroundColor = UIColor.blueColor()
        popularButton.setTitle("Popular", forState: .Normal)
        popularButton.frame = CGRectMake(50, 200, 275, 44)
        popularButton.addTarget(self, action: "pressedPopular:", forControlEvents: .TouchUpInside)
        self.view.addSubview(popularLabel)
        self.view.addSubview(popularButton)
        
        // MARK: Playlist Button
        let playlistLabel = UILabel()
        let playlistButton = UIButton()
        playlistLabel.frame = CGRectMake(50, 250, 275, 44)
        playlistButton.backgroundColor = UIColor.blueColor()
        playlistButton.setTitle("Playlist", forState: .Normal)
        playlistButton.frame = CGRectMake(50, 250, 275, 44)
        playlistButton.addTarget(self, action: "pressedPlaylist:", forControlEvents: .TouchUpInside)
        self.view.addSubview(playlistLabel)
        self.view.addSubview(playlistButton)
        
    }
    
    func pressedPopular(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PopularViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pressedPlaylist(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func didTapPopular(sender: AnyObject)
//    {
//        var viewController = PopularViewController(nibName: "PopularViewController", bundle: nil)
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    

    func refreshPlaylists() {
        PlaylistClient.popular {(playlists, error) -> Void in
            
            if var playlist0 = playlists?[0] {
                println(playlist0.title)
                println(playlist0.id)
            }
            if var playlist1 = playlists?[1] {
                println(playlist1.title)
                println(playlist1.id)
            }
            if var playlist2 = playlists?[2] {
                println(playlist2.title)
                println(playlist2.id)
            }
           
        }
    }
    
}
