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
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width = screenSize.width - 100
        
        // Add Title
        let title = UILabel()
        title.text = "Radio"
        title.textAlignment = .Center
        title.frame = CGRectMake(50, 33, width, 44)
        title.textColor = UIColor.darkGrayColor()
        self.view.addSubview(title)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
//        self.navigationController?.setNavigationBarHidden((true), animated: false)
//        
//        self.navigationController!.navigationBar.barTintColor = UIColor(red: 85/255, green: 20/255, blue: 17/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapRock(sender: AnyObject)
    {
        var viewController = SearchResponseViewController(nibName: "SearchResponseViewController", bundle: nil)
        viewController.searchRequest = "Rock"
        viewController.requester = "radio"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapPop(sender: AnyObject)
    {
        var viewController = SearchResponseViewController(nibName: "SearchResponseViewController", bundle: nil)
        viewController.searchRequest = "Pop"
        viewController.requester = "radio"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapMetal(sender: AnyObject)
    {
        var viewController = SearchResponseViewController(nibName: "SearchResponseViewController", bundle: nil)
        viewController.searchRequest = "Metal"
        viewController.requester = "radio"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapRelaxation(sender: AnyObject)
    {
        var viewController = SearchResponseViewController(nibName: "SearchResponseViewController", bundle: nil)
        viewController.searchRequest = "Relaxation"
        viewController.requester = "radio"
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
