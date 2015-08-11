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

    @IBAction func didTapPlaylistOne(sender: AnyObject) {
    
    }

}
