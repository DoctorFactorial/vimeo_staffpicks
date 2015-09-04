//
//  SearchViewController.swift
//  VimeoPlaylist2
//
//  Created by Michael Gordon on 17/08/2015.
//  Copyright (c) 2015 Personal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchTextField: UITextField?
    @IBOutlet var backButton: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.None
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        // Do any additional setup after loading the view.
        
        
        var searchImageView = UIImageView(frame: CGRectMake(0,0,50, self.searchTextField!.frame.size.height))
        searchImageView.image = UIImage(named: "SearchDarkIcon")
        searchImageView.contentMode = .Center
        
        self.searchTextField!.leftView = searchImageView
        self.searchTextField!.leftViewMode = .Always
        
        // Remove Navigation title
        self.navigationController?.navigationBar.topItem!.title = ""
        
        
        // Button 
//        let myButton = UIButton()
//        
//        myButton.setTitle("Back", forState: .Normal)
//        myButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        myButton.frame = CGRectMake(20, 80, 80, 20)
//        myButton.addTarget(self, action: Selector("backButton"), forControlEvents: .TouchUpInside)
//        self.view.addSubview(myButton)

    }
    
    // NOTE: Desgin / Dev conflict - Default not to have back button within tabs
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
       
        
    }
    
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        self.searchTextField?.becomeFirstResponder()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if (textField == self.searchTextField)
        {
            self.searchTextField?.resignFirstResponder()
            self.search()
        }
        return true
    }
    

    
    
    func search() {
        var searchRequest = self.searchTextField?.text
        
        if (searchRequest?.isEmpty == true)
        {
            //alert the user
            self.showAlert("Searching the abyss..? Try giving us a bit more to go on ;-)")
            
            return
        }
            
        else {
            println(searchRequest)
            var viewController = SearchResponseViewController(nibName: "SearchResponseViewController", bundle: nil)
            viewController.searchRequest = searchRequest!
            viewController.requester = "search"
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
//    func BackButton(sender: UIButton) {
//        navigationController?.popViewControllerAnimated(true)
//    }

//    
    @IBAction func BackButton(sender: UIButton!) {
        
        var viewController = TabBarController(nibName: nil, bundle: nil)
        //var dummyViewController = RadioViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(viewController, animated: false)
        //self.navigationController?.pushViewController(dummyViewController, animated: false)
        //self.navigationController?.popViewControllerAnimated(true) // Animation needs to go left to right and to YourMusic Tab
    }
    

}
