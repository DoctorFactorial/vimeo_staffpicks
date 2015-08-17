//
//  RockRadioViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 11/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class RockRadioViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    
    var items: Array<Video> = []
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Radio"
        self.setupTableView()
        self.refreshItems()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden((false), animated: false)
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
        RockRadioClient.popular {(videos, error) -> Void in
            
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