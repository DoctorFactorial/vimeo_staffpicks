//
//  PlaylistsViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 10/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class PlaylistsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshPlaylists()
        self.navigationController?.navigationBarHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPopular(sender: AnyObject)
    {
        var viewController = PopularViewController(nibName: "PopularViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    }


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
