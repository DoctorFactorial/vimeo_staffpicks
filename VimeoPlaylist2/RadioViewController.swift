//
//  RadioViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        
        
        self.edgesForExtendedLayout = UIRectEdge.None

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden((false), animated: false)
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 85/255, green: 20/255, blue: 17/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapRock(sender: AnyObject)
    {
        var viewController = RadioChannelViewController(nibName: "RadioChannelViewController", bundle: nil)
        viewController.searchRequest = "Rock"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapMetal(sender: AnyObject)
    {
        var viewController = RadioChannelViewController(nibName: "RadioChannelViewController", bundle: nil)
        viewController.searchRequest = "Metal"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
