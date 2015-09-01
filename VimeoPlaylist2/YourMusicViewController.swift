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
        self.navigationController?.navigationBarHidden = true
        
        refreshItems()
        // Do any additional setup after loading the view.
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width = screenSize.width - 100
        
        // Add Title
        let title = UILabel()
        title.text = "Your Music"
        title.textAlignment = .Center
        title.frame = CGRectMake(50, 33, width, 44)
        title.textColor = UIColor.blackColor()
        self.view.addSubview(title)

        
        // Add the 3 Default Playlists + menu items dynamically
        var playlists = [
                ["name": "AtWork", "red": 0, "green": 165, "blue": 229],
                ["name": "Bike", "red": 42, "green": 154, "blue": 42],
                ["name": "AtHome", "red": 229, "green": 150, "blue": 0],
                ["name": "NEW PLAYLIST", "red": 209, "green": 209, "blue": 209], // Last two are separated
                ["name": "Import your Playlists", "red": 42, "green": 154, "blue": 42] // New playlists should be added above them
        ]
            

        
        // Playlist Buttons
        for (index, value) in enumerate(playlists)
        {
            var playlist = playlists[index]
            var buttonName = playlist["name"] as! String
            var actionName = buttonName + ":"
            
            var red = CGFloat((playlist["red"] as! Float)/255)
            var green = CGFloat((playlist["green"] as! Float)/255)
            var blue = CGFloat((playlist["blue"] as! Float)/255)
            
            var x = CGFloat(50)
            
            var y = CGFloat(150 + 66 * index)
            
            if (index + 2 >= playlists.count)
            {
                y = y + 50
            }
            
            
            let myButton = UIButton()
            
            myButton.setTitle("\(buttonName)", forState: .Normal)
            myButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            myButton.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
            myButton.frame = CGRectMake(x, y, width, 44)
            myButton.addTarget(self, action: Selector(actionName), forControlEvents: .TouchUpInside)
            self.view.addSubview(myButton)
            
        }
        
    }
    

    func AtWork(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 0
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func Bike(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 1
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func AtHome(sender: UIButton!) {
        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
        // 3. After viewController definition before call, set playlists variable for use in other controller
        viewController.playlists = self.items
        viewController.index = 2
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
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
    
//    func didTapAtWorkButton(sender: UIButton) {
//        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
//        // 3. After viewController definition before call, set playlists variable for use in other controller
//        viewController.playlists = self.items
//        viewController.index = 3
//        self.navigationController?.pushViewController(viewController, animated: true)
//        
//    }
//
//    @IBAction func didTapAtWork(sender: AnyObject) {
//        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
//        // 3. After viewController definition before call, set playlists variable for use in other controller
//        viewController.playlists = self.items
//        viewController.index = 0
//        self.navigationController?.pushViewController(viewController, animated: true)
//    
//    }
//    
//    @IBAction func didTapPlaylistOne(sender: AnyObject) {
//        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
//        // 3. Acter viewController definition before call, set playlists variable for use in other controller
//        viewController.playlists = self.items
//        viewController.index = 1
//        self.navigationController?.pushViewController(viewController, animated: true)
//        
//    }
//    
//    @IBAction func didTapPlaylistTwo(sender: AnyObject) {
//        var viewController = PlaylistViewController(nibName: "PlaylistViewController", bundle: nil)
//        // 3. Acter viewController definition before call, set playlists variable for use in other controller
//        viewController.playlists = self.items
//        viewController.index = 2
//        self.navigationController?.pushViewController(viewController, animated: true)
//        
//    }
    
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
