//
//  PlaylistsViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 10/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class YourMusicViewController: UIViewController {

    // 1. Define Empty Playlist for Populating Playlist Ids
    var items: Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        
        refreshItems()
        // Do any additional setup after loading the view.
        
        
        // Add the 3 Default buttons dynamically
        var buttonNames = ["AtWork", "Bike", "AtHome"]
        
        for (index, value) in enumerate(buttonNames)
        {
            var buttonName = buttonNames[index]
            var actionName = buttonName + ":"
            
            var x = CGFloat(50)
            var y = CGFloat(50 * index)
            
            let myButton = UIButton()
            
            myButton.setTitle("\(buttonName)", forState: .Normal)
            myButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            myButton.backgroundColor = UIColor.blueColor()
            myButton.frame = CGRectMake(x, y, 300, 44)
            myButton.addTarget(self, action: Selector(actionName), forControlEvents: .TouchUpInside)
            self.view.addSubview(myButton)
            
        }
        
    }
    

    func AtWork(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 4
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func Bike(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 5
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func AtHome(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 6
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
    }
    
//    override func viewWillDisappear(animated: Bool)
//    {
//        super.viewWillDisappear(animated)
//        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//    }

    
//    @IBAction func didTapPopular(sender: AnyObject)
//    {
//        var viewController = PopularViewController(nibName: "PopularViewController", bundle: nil)
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
    func didTapAtWorkButton(sender: UIButton) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 3
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

    @IBAction func didTapAtWork(sender: AnyObject) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 0
        self.navigationController?.pushViewController(viewController, animated: true)
    
    }
    
    @IBAction func didTapPlaylistOne(sender: AnyObject) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. Acter viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 1
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func didTapPlaylistTwo(sender: AnyObject) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. Acter viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 2
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
//    @IBAction func didTapRadio(sender: AnyObject) {
//        var viewController = RadioViewController(nibName: "RadioViewController", bundle: nil)
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
    
    // 2. Fetch Playlist Ids
    func refreshItems() {
        
        //var playlistArray: Array<String> = []
        
        PopularPlaylistsClient.popular {(playlists, error) -> Void in
            
            if let constPlaylists = playlists {
                
                for playlist: Playlist in constPlaylists {
                    
                    self.items.append(playlist.id!)
                    
                    //playlistArray.append(playlist.id!)
                    
                }
            }
            else {
                // TODO: alert the user
            }
        }
    }
    


}
