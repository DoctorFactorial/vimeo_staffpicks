//
//  StaffPicksViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 09/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//
import UIKit
class StaffPicksViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView?
    
    let items = ["alfie", "lee", "mattan", "syd", "zach"]
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Staff Picks"
        self.setupTableView()
        self.refreshItems()
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
        
        cell.nameLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    func refreshItems() {
        VimeoClient.staffpicks {(object, error) -> Void in
            println("error: \(error) \n object: \(object)")
        }
    }
    
    
}