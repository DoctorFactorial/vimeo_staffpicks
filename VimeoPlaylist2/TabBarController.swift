//
//  TabBarController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 17/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var radioViewController = RadioViewController(nibName: "RadioViewController", bundle: nil)
        
        
        var playlistsViewController = PlaylistsViewController(nibName: "PlaylistsViewController", bundle: nil)

        
        var searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)

        
        var viewControllers = [radioViewController, playlistsViewController, searchViewController]
        
        self.setViewControllers(viewControllers, animated: true)
        
        var imageNames = ["RadioIcon", "ToggleIcon", "SearchIcon"]
        
        let tabItems = tabBar.items as! [UITabBarItem]
        for (index, value) in enumerate(tabItems)
        {
            var imageName = imageNames[index]
            value.image = UIImage(named: imageName)
            
            value.imageInsets = UIEdgeInsetsMake(5.0, 0, -5.0, 0)
        }
        
        self.tabBarController?.selectedIndex = 0
        
        self.edgesForExtendedLayout = UIRectEdge.None
        self.navigationItem.hidesBackButton = true
        
        self.tabBar.translucent = false
        

        
    }
    

    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "HUMM Music"
        self.navigationController?.setNavigationBarHidden(false, animated: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
