//
//  RockRadioViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class SearchResponseViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    
    var requester: String = ""
    var filePath: String = ""
    
    var items: Array<Video> = []
    
    var searchRequest: String = ""
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.title = "Radio"
        
        self.setupTableView()
        self.refreshItems()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.tableView?.separatorColor = UIColor.whiteColor()
        
        // Remove Navigation title
        self.navigationController?.navigationBar.topItem!.title = ""
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let width = screenSize.width - 100
        
        // Add View Title Dynamically
        let title = UILabel()
        title.text = searchRequest
        title.textAlignment = .Center
        title.frame = CGRectMake(50, 22, width, 44)
        title.textColor = UIColor.darkGrayColor()
        self.view.addSubview(title)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden((false), animated: false)

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.darkGrayColor()
        
        // Remove Navigation title
        self.navigationController?.navigationBar.topItem!.title = ""


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
    

    func refreshItems() {
        switch (requester)
        {
        case "radio":
            RadioClient.popular(searchRequest) { (videos, error) -> Void in
                
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

        default:
            SearchClient.popular(searchRequest) { (videos, error) -> Void in
                
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
        
    }
}